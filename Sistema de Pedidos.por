algoritmo
	declare opcao, contador, codigo, codigoItem, contador2, contador3, valorTotal, valor numerico
		clienteExiste, produtoExiste logico
		resposta literal
		cliente[5] registro (nome, endereco literal telefone, codigo numerico)
		produto[5] registro (nome literal codigo, quantidade, valor numerico)
		pedido[5] registro (codigo, cliente, valorTotal numerico)
		item[25] registro (pedido, codigo, produto, quantidade, valorTotal numerico)
	repita	
		limpar_tela()
		montarMenu()
	
		leia opcao
	
		se opcao = 1 entao
 //Cadastro de Cliente
		inicio
			cadastroCliente()
		fim
		se opcao = 2 entao//Cadastro de produto
		inicio
			contador <- 1
			codigo <- 0
			enquanto contador <= 5 faca
			inicio
				se produto[contador].codigo > codigo entao
				inicio
					codigo <- produto[contador].codigo					
				fim
				contador <- contador + 1
			fim
		
			contador <- codigo + 1
			repita
				limpar_tela() 
				escreva "Cadastro de produto"
				escreva "-------------------"
				produto[contador].codigo <- contador
				
				escreva "Nome:"
				leia produto[contador].nome
		
				escreva "Quantidade:"
				leia produto[contador].quantidade
				escreva "Valor:"
				leia produto[contador].valor
				
				escreva "Deseja cadastrar um novo produto? S - Sim, N - Não"
				leia resposta
				contador <- contador + 1
			ate contador > 5 ou resposta = "n" ou resposta = "N"
		fim
		se opcao = 3 entao//cadastro de pedido
		inicio
			contador <- 1
			codigo <- 0
			enquanto contador <= 5 faca
			inicio
				se pedido[contador].codigo > codigo entao
				inicio
					codigo <- pedido[contador].codigo					
				fim
				contador <- contador + 1
			fim
		
			contador <- codigo + 1
			repita
				limpar_tela() 
				escreva "Cadastro de pedido"
				escreva "-------------------"
				pedido[contador].codigo <- contador
				escreva "Informe o código do cliente"
				leia codigo
				clienteExiste <- falso
				contador2 <- 1 
				repita
					se codigo = cliente[contador2].codigo entao
					inicio
						clienteExiste <- verdadeiro
					fim
					contador2 <- contador2 + 1
				ate contador2 > 5 ou clienteExiste = verdadeiro
						
				se clienteExiste = verdadeiro entao
				inicio
			
					pedido[contador].cliente <- codigo
					contador2 <- 1
					codigoItem <- 0
					enquanto contador2 <= 25 faca
					inicio
						se item[contador2].pedido > 0 entao
						inicio
							se item[contador2].pedido = pedido[contador].codigo entao
							inicio
								se item[contador2].codigo > codigoItem entao
								inicio
									codigoItem <- item[contador2].codigo
								fim
							fim					
						fim
						contador2 <- contador2 + 1
					fim
		
					escreva "Informe os itens:"
		
					contador2 <- codigoItem + 1
					repita
						escreva "Informe o código do Produto:"
						leia codigo
						produtoExiste <- falso
						contador3 <- 1 
						repita
							se codigo = produto[contador3].codigo entao
							inicio
							     valor <- produto[contador3].valor
								produtoExiste <- verdadeiro
							fim
							contador3 <- contador3 + 1
						ate contador3 > 5 ou produtoExiste = verdadeiro
						se produtoExiste = verdadeiro entao
						inicio
							item[contador2].pedido <- pedido[contador].codigo
							item[contador2].produto <- codigo
	
							escreva "Quantidade"
							leia item[contador2].quantidade	
	
							valorTotal <- valorTotal + (item[contador2].quantidade * valor)
							escreva "Deseja cadastrar um novo item? S - Sim, N - Não"
							leia resposta
						fim
						senao
						inicio
							escreva "Produto não cadastrado"
							leia resposta
							resposta <- "N"							
						fim
						contador2 <- contador2 + 1
					ate contador2 > 5 ou resposta = "n" ou resposta = "N"
					resposta <- ""
					pedido[contador].valorTotal <- valorTotal
					
					escreva "Deseja cadastrar um novo pedido? S - Sim, N - Não"
					leia resposta
				fim
				senao
				inicio
					escreva "Cliente não cadastrado"
					leia resposta
					resposta <- "N"
				fim
				
				contador <- contador + 1
			ate contador > 5 ou resposta = "n" ou resposta = "N"
		fim
		
		se opcao = 4 entao
//consulta de cliente
		inicio
			limpar_tela()
			escreva "Consulta de cliente"
			escreva "-------------------"
			para contador <- 1 ate 5 faca
			inicio 
				se cliente[contador].nome <> "" entao
				inicio
					escreva "NOME: ", cliente[contador].nome, 
						   " - ENDEREÇO: ", cliente[contador].endereco, 
						   " - TELEFONE: ", cliente[contador].telefone
				fim
			fim	
			escreva " "
			escreva "Clique para continuar..."		
			leia resposta
		fim	
		
		se opcao = 5 entao//consulta de produto
		inicio
			limpar_tela()
			escreva "Consulta de produto"
			escreva "-------------------"
			para contador <- 1 ate 5 faca
			inicio 
				se produto[contador].nome <> "" entao
				inicio
					escreva "CODIGO: ", produto[contador].codigo,
						   " - NOME: ", produto[contador].nome, 
						   " - QUANTIDADE: ", produto[contador].quantidade, 
						   " - VALOR: ", produto[contador].valor
				fim
			fim	
			escreva " "
			escreva "Clique para continuar..."		
			leia resposta
		fim		
		
		se opcao = 6 entao//Consultar pedido
		inicio
			limpar_tela()
			escreva "Consulta de Pedidos"
			escreva "-------------------"
			para contador <- 1 ate 5 faca
			inicio
				se pedido[contador].codigo > 0 entao
				inicio
					escreva "CODIGO: ", pedido[contador].codigo,
						   " - CLIENTE: ", pedido[contador].cliente,
						   " - VALOR TOTAL: ", pedido[contador].valorTotal
					escreva "Itens do pedido"
					para contador2 <- 1 ate 25 faca
					inicio
						se item[contador2].pedido = pedido[contador].codigo entao
						inicio
							escreva "CODIGO: ", item[contador2].codigo,
						   		   " - PRODUTO: ", item[contador2].produto,
						             " - QUANTIDADE: ", item[contador2].quantidade
						fim
					fim					
				fim
				
			fim
			escreva " "
			escreva "Clique para continuar..."		
			leia resposta
		fim
	ate opcao = 0
	
fim_algoritmo
sub-rotina montarMenu()
	escreva "1 - Cadastro de Cliente"
	escreva "2 - Cadastro de Produto"
	escreva "3 - Cadastro de Pedido"
	escreva "4 - Consulta de Clientes"
	escreva "5 - Consulta de Produto"
	escreva "6 - Consulta de Pedidos"
	escreva "0 - Sair do Sistema"	
fim_sub_rotina montarMenu
sub-rotina cadastroCliente ()
	contador <- 1
	codigo <- 0
	enquanto contador <= 5 faca
	inicio
		se cliente[contador].codigo > codigo entao
		inicio
			codigo <- cliente[contador].codigo					
		fim
		contador <- contador + 1
	fim
	
	contador <- codigo + 1
	repita
		limpar_tela() 
		escreva "Cadastro de cliente"
		escreva "-------------------"
		cliente[contador].codigo <- contador
		escreva "Nome:"
		leia cliente[contador].nome
		escreva "Endereco:"
		leia cliente[contador].endereco
		escreva "Telefone:"
		leia cliente[contador].telefone
		escreva ""
		escreva "Deseja cadastrar um novo cliente? S - Sim, N - Não"
		leia resposta
		contador <- contador + 1
	ate contador > 5 ou resposta = "n" ou resposta = "N"
fim_sub_rotina cadastroCliente
