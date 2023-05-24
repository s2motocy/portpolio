package com.cook.mymealkit.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cook.mymealkit.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("파일 업로드 컨트롤러: form 방식 ");
	}
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		String uploadFolder = "C:\\upload";
		for(MultipartFile i : uploadFile) {
			log.info("----------------");
			log.info("Upload File Name: "+ i.getOriginalFilename());
			log.info("Upload File Size: "+ i.getSize());
			//p499
			File saveFile = new File(uploadFolder, i.getOriginalFilename());  // java.io.File 로 설정
			try {
				i.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} // catch
		} // for
	}
	
	//p500 (ajax 를 이용한 파일업로드)
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	//p508 (날짜 이용하여 폴더와 파일 생성)
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(); // java.util.Date
		String str = sdf.format(date);
		return str.replace("-", File.separator); // - 를 파일의 구분자로 대체(replace)
	}
	//p513
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	//p504 => 파일 저장
	@PostMapping("/uploadAjaxAction")
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("ajax file Controller: ");
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		// 폴더 생성
		String uploadFolderPath= getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: "+uploadPath);
		if(!uploadPath.exists()) uploadPath.mkdirs(); // 폴더가 존재하지 않으면 생성함 (mkdir / make directory)
		
		// 연도 폴더 생성
		for(MultipartFile i : uploadFile) {
			AttachFileDTO attachDto = new AttachFileDTO();
			log.info("-------------------");
			log.info("Upload File Name: "+ i.getOriginalFilename());
			log.info("Upload File Size: "+ i.getSize());
			String uploadFileName = i.getOriginalFilename();
			attachDto.setFileName(uploadFileName);
			// IE 에 대한 처리 (전체 경로가 오므로 마지막 파일만 추출하기 위해
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1); // \ 가 마지막 글자부터 몇번째 있는가, 0부터 1을 더한다
			// C:\\upload\a.jpg
			log.info("only file name: "+ uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_"+ uploadFileName;
			// 이후에는 uuid 가 결합된 상태
//			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				i.transferTo(saveFile); // 저장은 여기에서 한다				
				attachDto.setUploadPath(uploadFolderPath);
				attachDto.setUuid(uuid.toString());
				//image 인지 체크
				if(checkImageType(saveFile)) {
					attachDto.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+ uploadFileName));
					Thumbnailator.createThumbnail(i.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				// 리스트 에 추가
				list.add(attachDto);
			} catch (Exception e) {
				e.printStackTrace();
			} // catch
		}// for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	//p526
	@GetMapping("/display")
	@ResponseBody
	public  ResponseEntity<byte[]> getFile(String fileName) { // File 객체를 Byte 배열로 변환하여 header 와 함께 반환함
		log.info("upload controller file display: " + fileName);
		File file = new File("c:\\upload\\" + fileName);
		log.info("file 객체 : "+ file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	//p531
	// MIME 타입은 다운로드 할 수 있는 application/octet_stream 으로 지정하고 다운로드시 저장되는 이름은
	// Content-Disposition 을 이용하여 저장
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		log.info("upload controller download : " + fileName);
		FileSystemResource resource = new FileSystemResource("C:\\upload\\"+fileName);
		log.info("resource : "+resource);
		String resourceName = resource.getFilename();
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Disposition", "attachment; fileName=" + new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
	}
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("upload controller 삭제 : fileName: "+ fileName + " , type: "+ type);
		File file;
		try {
			file= new File("c:\\upload\\"+ URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("원래 파일명: " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			} // if
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
