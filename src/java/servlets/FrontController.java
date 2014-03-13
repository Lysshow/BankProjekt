package servlets;

import commands.AddAccountCommand;
import commands.AddCustomerCommand;
import commands.Command;
import commands.EditCustomerCommand;
import commands.ListAccountsCommand;
import commands.ListCustomersCommand;
import commands.ListDetailsAccountsCommand;
import commands.PrepareTransferCommand;
import commands.TargetCommand;
import commands.TransferCommand;
import commands.ShowLoginCommand;
import commands.LoginCommand;
import commands.LogoutCommand;
import commands.SaveAccountCommand;
import commands.SaveCustomerCommand;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import security.SecurityRole;

@WebServlet(name = "FrontController", urlPatterns = {"/Controller"})
public class FrontController extends HttpServlet {

    private final Map<String, Command> commands = new HashMap<>();

    public FrontController() {

        commands.put("showlogin", new ShowLoginCommand("/login/login.jsp", Arrays.asList(SecurityRole.All)));
        
        Map<SecurityRole, String> roles = new HashMap();
        roles.put(SecurityRole.Employee, "main.jsp");
        roles.put(SecurityRole.SuperEmployee, "main.jsp");
        roles.put(SecurityRole.Customer, "main.jsp");
        commands.put("login", new LoginCommand(roles, "/login/login.jsp"));
        commands.put("logout", new LogoutCommand("main.jsp", Arrays.asList(SecurityRole.All)));

        commands.put("list-accounts", new ListAccountsCommand("account-list.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("details-accounts", new ListDetailsAccountsCommand("account-details.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("list-customers", new ListCustomersCommand("customer-list.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("transfer", new PrepareTransferCommand("transferForm.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("transferMoney", new TransferCommand("account-list.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("back", new TargetCommand("main.jsp", Arrays.asList(SecurityRole.All)));
        commands.put("main", new TargetCommand("main.jsp", Arrays.asList(SecurityRole.All)));
        
        commands.put("add-customer", new AddCustomerCommand("add-customer.jsp", Arrays.asList(SecurityRole.SuperEmployee)));
        commands.put("save-customer", new SaveCustomerCommand("add-customer.jsp", Arrays.asList(SecurityRole.SuperEmployee)));
        commands.put("edit-customer", new EditCustomerCommand("add-customer.jsp", Arrays.asList(SecurityRole.SuperEmployee)));
        
        commands.put("add-account", new AddAccountCommand("add-account.jsp", Arrays.asList(SecurityRole.SuperEmployee)));
        commands.put("save-account", new SaveAccountCommand("add-account.jsp", Arrays.asList(SecurityRole.SuperEmployee)));
        
        commands.put("hello", new SayHelloCommand("hello.jsp", Arrays.asList(SecurityRole.All)));
    }

    public Command getCommand(String cmdStr, HttpServletRequest request) {

        if (cmdStr == null) {
            cmdStr = "main";
        }

        Command cmd = commands.get(cmdStr);
        SecurityCheck(cmd, request);
        return cmd;
    }

    private void SecurityCheck(Command command, HttpServletRequest request) throws SecurityException {
        if (command instanceof TargetCommand) {
            List<SecurityRole> requiredRoles = ((TargetCommand) command).getRoles();
            boolean requiredRoleFound = false;
            for (SecurityRole requiredRole : requiredRoles) {
                if (requiredRole == SecurityRole.All || request.isUserInRole(requiredRole.toString())) {
                    requiredRoleFound = true;
                    break;
                }
            }
            if (!requiredRoleFound) {
                throw new SecurityException("You don't have the necessary rights to perform this command");
            }
        }
    }

    @Override
    protected void service(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {
        String key = request.getParameter("command");
        if (key == null) {
            key = "main";
        }
        Command command = commands.get(key);
        String target = command.execute(request);
        RequestDispatcher dispatcher = request.getRequestDispatcher(target);
        dispatcher.forward(request, response);
    }

}
