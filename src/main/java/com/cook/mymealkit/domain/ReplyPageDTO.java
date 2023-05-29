package com.cook.mymealkit.domain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyPageDTO {

	List<ReplyDTO> list;

	PageMakerDTO pageInfo;

}
