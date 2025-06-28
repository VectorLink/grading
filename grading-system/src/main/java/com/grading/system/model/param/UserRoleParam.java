package com.grading.system.model.param;

import java.util.List;
import com.grading.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户类型查询参数
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserRoleParam extends BaseEntity {
    /**
     * 查询用户角色
     */
    private List<String> roles;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 用户电话
     */
    private String telephone;
    /**
     * 部门ID
     */
    private Long deptId;
}
