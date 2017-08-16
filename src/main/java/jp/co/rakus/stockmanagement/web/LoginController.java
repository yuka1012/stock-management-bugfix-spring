package jp.co.rakus.stockmanagement.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jp.co.rakus.stockmanagement.domain.Member;
import jp.co.rakus.stockmanagement.service.MemberService;

/**
 * ログイン関連処理を行うコントローラー.
 * @author igamasayuki
 *
 */
@Controller
@RequestMapping("/")
public class LoginController {
	
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberService memberService;

	/**
	 * フォームを初期化します.
	 * @return フォーム
	 */
	@ModelAttribute
	public LoginForm setUpForm() {
		return new LoginForm();
	}

	/**
	 * ログイン画面を表示します.
	 * @return ログイン画面
	 */
	@RequestMapping
	public String index() {
		return "loginForm";
	}
	
	/**
	 * ログイン処理を行います.
	 * @param form　フォーム
	 * @param result　リザルト
	 * @param model　モデル
	 * @return　ログイン成功時：書籍リスト画面
	 */
	@RequestMapping(value = "/login")
	public String login(@Validated LoginForm form,
			BindingResult result, Model model) {
		if (result.hasErrors()){
			return index();
		}
		String mailAddress = form.getMailAddress();
		String password = form.getPassword();
		Member member = memberService.findOneByMailAddressAndPassword(mailAddress, password);
		if (member == null) {
			ObjectError error = new ObjectError("loginerror", "メールアドレスまたはパスワードが違います。");
            result.addError(error);
			return index();
		}
		session.setAttribute("member", member);
		return "redirect:/book/list";
	}
}
