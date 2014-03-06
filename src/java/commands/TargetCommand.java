package commands;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import security.SecurityRole;

public class TargetCommand implements Command {

    private final String target;
    List<SecurityRole> roles;

    public TargetCommand(String target, List<SecurityRole> roles) {
        this.target = target;
        this.roles = roles;
    }

    public List<SecurityRole> getRoles() {
        return roles;
    }

    @Override
    public String execute(HttpServletRequest request) {
        return target;
    }

}
