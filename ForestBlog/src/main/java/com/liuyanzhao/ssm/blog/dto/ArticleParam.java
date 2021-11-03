package com.liuyanzhao.ssm.blog.dto;

import lombok.Data;

import java.util.List;

/**
 * @author 言曌
 * @date 2018/11/25 下午3:56
 */
@Data
public class ArticleParam {

    private Integer articleId;

    private String articleTitle;

    private String articleContent;

    private Integer categoryParent;

    private Integer categoryChild;

    private Integer articleOrder;

    private Integer articleStatus;

    private String articleThumbnail;

    private List<Integer> articleTagIds;

}
