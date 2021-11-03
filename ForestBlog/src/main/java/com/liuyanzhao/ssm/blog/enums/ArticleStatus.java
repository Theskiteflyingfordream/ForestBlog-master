package com.liuyanzhao.ssm.blog.enums;

/**
 * @author 言曌
 * @date 2018/11/17 下午4:47
 */

public enum ArticleStatus {

    PUBLISH(1, "已发布"),
    DRAFT(0, "草稿");

    private Integer value;

    private String message;

    ArticleStatus(Integer value, String message) {
        this.value = value;
        this.message = message;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    /*枚举类型使用setter有效?不应该是常量final吗?*/
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
