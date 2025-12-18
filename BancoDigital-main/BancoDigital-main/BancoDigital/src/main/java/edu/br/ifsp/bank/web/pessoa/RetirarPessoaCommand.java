 package edu.br.ifsp.bank.web.pessoa;

import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;

import edu.br.ifsp.bank.modelo.GeradorPdf;
import edu.br.ifsp.bank.modelo.Pessoa;
import edu.br.ifsp.bank.modelo.Transferencia;
import edu.br.ifsp.bank.persistencia.PessoaDao;
import edu.br.ifsp.bank.persistencia.TransferenciaDao;
import edu.br.ifsp.bank.web.Command;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RetirarPessoaCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PessoaDao pdao = new PessoaDao();
        TransferenciaDao tdao = new TransferenciaDao();

        HttpSession session = request.getSession();
        session.removeAttribute("ultimaTransferencia");
        session.removeAttribute("tipoPdf");
        Pessoa logado = (Pessoa) session.getAttribute("usuarioLogado");

        String valorStr = request.getParameter("valor");

        if (request.getMethod().equalsIgnoreCase("GET") || valorStr == null) {
        	session.removeAttribute("ultimaTransferencia");
            session.removeAttribute("tipoPdf");
            request.getRequestDispatcher("/pages/business/retirar.jsp").forward(request, response);
            return;
        }

        try {
            float valor = Float.parseFloat(valorStr);

            Transferencia retirada = tdao.retirar(logado.getCpf(), valor);

            Pessoa atualizado = pdao.findByCPF(logado.getCpf());
            session.setAttribute("usuarioLogado", atualizado);
            
            session.setAttribute("ultimaTransferencia", retirada);
	         session.setAttribute("tipoPdf", "saque");
            
	         request.setAttribute("sucesso", true);
	         request.getRequestDispatcher("/pages/business/retirar.jsp")
	                .forward(request, response);
	         return;

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao realizar retirada.");
            request.getRequestDispatcher("/pages/business/retirar.jsp").forward(request, response);
        }
    }
}