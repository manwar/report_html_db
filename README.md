# report\_html\_db
Projeto de iniciação científica, componente utilizado para gerar site(com conteúdo dinâmico) baseado nos resultados de componentes utilizados anteriormente

Para instalar dependencias:

sudo apt-get install sqlite3

cpan DBIx::Class Catalyst::Devel Catalyst::Runtime Catalyst::View::TT Catalyst::View::JSON Catalyst::Model::DBIC::Schema  DBIx::Class::Schema::Loader MooseX::NonMoose Helper::ResultSet::SetOperations

Para rodar:

bigou\_m.pl -c html\_db.cnf -d database\_name -u username\_database -p password -h address -o output\_dir

Inicialize o servidor:

./Test/script/test\_server.pl -r
  
Acesse o site:

http://127.0.0.1:3000

https://metacpan.org/pod/Future::AsyncAwait#async


TODO:
-
-   Acesso a Search Database - ainda está um pouco lento - add async clients


Dev:
-


Test:
-
-   Search Database 
-       Ribosomal binding sites:
-           Na tabela apresentada na tela, aparece Position shift "undefined" para valores 0
-           New start deve apresentar o códon de início novo ou, quando não houver mudança, o mesmo que old  (repete) 
-           Checar correlação entre as coordenadas apresentadas na tabela e aquela salvas no arquivo txt para download. 
-           Link do result deve apresentar o texto em uma nova aba. Isso vale para todos os demais componentes!     
-       Tandem Repeats:
-           Quando não encontrado: "No results found" 
-       Protein-coding genes:
-           Resultados (links internos) do InterProScan apresentam a página na mesma aba, sem retorno possível.
-           Idem KEGG nos links tipo ko00400   
-   BLAST:
-       Database - All genes - nucleotide sequences, Contigs - nucleotide sequences, Protein sequences
-       (tblastn or tblastx only)
-       Gap costs deve oferecer um menu de escolhas apropriadas para cada programa do blast
-       Demais opções também devem oferecer menu restrito. Basear-se no NCBI Blast   

Done:
-
-	Criar clients em perl para uso do caminho da aplicação de serviços no arquivo de configuração
-	Precisamos atualizar o conteudo HTML que sera escrito pelo script
-	Apontar os clients js para o website
-	Colocar Interpro description e id no nome do painel
-	Atualizar Repository(linhas 858, 861, 864, 868, 1064, 1067, 1070), action.js
-	Testar todas as pesquisa
-	Função do repositorio recebe parametro de page\_size(limite em quantidade) e offset(compensação antes de pegar o limite)
-	Service preenche e retorna PagedResponse passando a resposta do repositorio + os parametros page size, offset e total(quantidade de retornados)
-	Service.Client envia parametros page\_size e offset, retorna paged response
-	Aplicação envia parametros de page\_size e offset ao client, retorna paged response
-	JS recebe paged response, precisa de uma variavel global ou criação de input hidden contendo offset += 10 e pageSize = 10
-	Global analyses
-	report\_html\_db.pl deve executar makeblastdb nos arquivos do Services
-	Criar controller no Services para blast
-	Criar função blast no Services
-	Criar BlastRepository.pm
-	Criar BlastClient.pm
-	Criar BlastController no Website para recebe
-	Conversar com professor J sobre os componentes que não tem resultados (se devem ser exibidos mesmo que não tenha nenhuma informação)r requisição para usar BlastClient
-	Criar arquivos js para requisitar Blast
-	search BLAST deve retornar conteúdo no formato padrão
-	Criar função para executar fancy\_blast.pl que vai receber o conteudo do arquivo, a função irá criar um arquivo temporário e armazenar o conteúdo BLAST nele, salvar o conteudo do fancy\_blast em diretorio temporario e retornar conteúdo arquivo .html e arquivo .png; O arquivo .png deve ser retornado em base64
-	Adicionar acesso ao repositorio e services a função de pegar o identificador e descrição de buscas de similaridade
-	Criar função verify\_element se baseando na função do report\_html.pl - Done
-	Separar componentes (condicionais) das evidencias e subevidencias se baseando no report\_html.pl
-	Utilizar \@comp\_ev e \@comp\_dna do report\_html.pl para poder utilizar a função verify\_element na refatoração
-	Modificar Repository.pm atual para SearchDatabaseRepository.pm
-	Modificar e atualizar action.js para search-database.js
-	Adicionar fileHandler.js para o assets.tar.gz
-	Inserir Blast.pm, BlastRepository.pm, BlastClient.pm report\_html\_db.pl services e website
-	Atualizar HTMLs
-	Atualizar SearchDatabase report\_html\_db.pl services e website
-	Criar função que va receber locus\_tag + nome do componente, realize consulta no SQLite e retorne o conteudo do arquivo
- 	Resolver bugs dos componentes na parte de analises de proteinas codificantes
-	Encobrir no report\_html\_\_db.pl os componentes que não estão criando links simbolicos e adicionando ao SQLite
-	Corrigir a parte do phobius das analises cds
-	Arrumar erros da pagina do BLAST, alguma notificação caso não haja resposta
-	tandem repeats (sequencia muito pequena, não encontra gene) e alienhunter(horizontal transfer genes) não estão com links para determinada sequencia
-	Adicionar links as evidencias/componentes que não tem resultados
-	Ver como funcionam os filtros usando os parametros -dust e -seg do BLAST - consultar documentacao // considerar como opção avançada?
-	Verificar como vão funcionar as opções avançadas do BLAST - validar dados a serem executados como parametros e apenas adicionar no comando
-	tRNA: Remover "or" da primeira opção
-	Phobius: Marcar peptídeo sinal como padrão
-	Validar parametros no services do BLAST
-	Paginação: Resolver atualização do numero da pagina
-	Alienhunter, Terminator, RBS: 3 colunas(dos resultados) e link para sequência
-	tRNA: Bug exibindo tudo quando não existe
-	Analyses of protein coding genes: 
-	não esta mostrando erro caso não encontra nada
-	Busca por identificador do orthology não esta funcionando
-	Transporter: Não mostra se esta vazio


-	Remover redundancia de inserções e correções de textos da pagina SearchDatabase
-	Atualizar SearchDatabaseRepository, SearchDatabase do Services e search-database.js
-	Blast services esta com caminhos fixos para o banco de dados
-	Criar arquivo unificado de sequencias separando pelos tipos para geração do makeblastdb
-	Adicionar valor absoluto para pegar arquivos para download
-	Paginar resultados de tabelas
-	Script deve gerar arquivos fasta de CDS(done); ribosomal RNA; transferRNA; other non coding;
-	Atualizar LIMIT e OFFSET nas pesquisas tandemRepeats, transcriptionalTerminators, ribosomalBindingSites, horizontalGeneTransfers, ncRNA no SearchDatabaseRepository, SearchDatabaseController do services  e no SearchDatabaseController do website
-	All-genes: colocar reverso complementar e colocar todos os genes(e não somente CDS)
-	Protein-coding genes para CDS
-	Alinhar sequencia de nucleotídeos
-       Arquivos das análises de DNA
-       tRNA: Adicionar link do arquivo
-       Arquivos das analises estão linkados no SQLite, criar função para acesso e link para baixar 
-       Adicionar opção de selecionar contig em pesquisas de gene
-	Preparar SearchDatabase do website, search-database.js e site-client.js para searchGene
-       Global analyses:
-       Go mapping: expansible tree
-       KEGG pathways: link errado
-       Criar pagina de erro geral
-	Corrigir report\_html\_db.pl, parte do script de download; Site.pm 275
-	sequencia esta bugada, adicionar div col-md-12
-       correção porra do numero da paginação não reseta
-   "annotation\_signalP.pl" => 'SignalP' adicionar tudo do signalp
-	Correção de global analyses, acesso a arquivos internos

-	Opção tblastn não funciona (query proteína e o db é nucleotídica) e tblastx também não.
-	Botão "Clear sequence" não funciona
-	Tratar adequadamente qualquer caractere do cabeçalho de uma sequência FASTA
-	TMHMM - Predicted TMHs  -> Predicted Transmembrane domains
-	Contig: All (default)
-	Gene type deve ser Gene predictor
-	No resultado da busca, informar total de resultados. Ao lado do Back:   Found 49 results.
-	Em tRNA, rever gene name. Aponta Gly???
-	annotation\_predgpi: 
-        Dados gerais: start, end, strand
-        Dados de regiões com resultados positivos: name, position, specificity, sequence 
-	annotation\_bigpi: 
-        Dados gerais: start, end, strand
-        Dados de regiões com resultados positivos: pvalue, position
-	annotation\_dgpi.pl: 
-        Dados: start, end, strand, score, cleavage_site
-	Onde estão os resultados do RNAmmer? Tem que fazer um formulário.
-	Formulario TMHMM e componentes GPI analyses
-	Substituir painel "Protein-sequence and gene IDs" por "Gene IDs"
-	No painel Gene IDs", remover opção "Gene description"
-	Substituir "Predicted rRNAs" por rRNA
-	Alterar nome do painel "Analyses of protein-coding genes" para "Protein-coding genes"
-	incluir All (default) na combo box
-	tRNA: Anticodon: TGG at 35-37 (89393-89391) não está incluso. Is psedugene - checar
-	Contig\_1 ao invés de colocar o link no Contig\_1, escrever "Contig\_1 (result) e colocar o link no result.
-	Tirar o link do Contig nos programas e incluir um link "Result" no painel. TRF e outros programas
-	Other non-coding RNAs: (e.g. 1e-6 or; 0.000001) - aceitar ponto ou vírgula
-	E-value
-	Checar se inseriu errado no banco ou se report tá falhando.
-	Search Database está muito lento
-	KEGG  - adicionar no painel uma opção "View map" cujo link aponta para a via metabolica (kegg\_report/pathway\_figures/K00609-ko00240.html)
-	Remover cor azul de links que não são links em paineis
-	No painel "Protein-coding genes, incluir a caixa "match all terms"
-	Página de resultados de uma proteína

-	Gene Predictor: programa que fez a predição (ex. Glimmer 3.01).

-	Alterar output (se tiver isso no banco)

Outside the cytoplasm				1		503
Transmembrane helix         		504		523
Inside the cytoplasm				524		529
Transmembrane helix		        	530		552
Outside  the cytoplasm      		553		562

-	Idem Phobius
-	Busca por contig:
-	Alterar painel: 
-	Fica "Contig search results" e um botão do lado direito "Download FASTA" e... a sequência com formato FASTA

\>Contig\_4 (4444-55555)

GGGTGACGA TGCCGAGCAGCCCGAGGTGCAGGACGGCACCGTCGAAGCCCTCGTCGCCGCGCGCGACGG TGCGTCGCTCGCCGTCGCCACCGAGCACTTCGAAGGACCGCACCGCCGTGCTGAGCGAGC CGAGCCGGGTTCCGGAGCCGTGCGTCCCGGTGGCGATCGCGCCGCCGAGCGAGATGTGCG GGAGCGAACCCGTGTTGTGCAGGGCGACCCCGGCGGCGTCCAGGTCGGGCGCGACGACGC CGTACCGGGTGCCGGCGCCCATCGTCGCGGTGCCGGCGGCGGTGTCGACCACGAGGTCGG TGGGGATGCCGGTCAGGTCGA

-	Eliminar espaços da sequência, fazer a formatação correta.
-   BLAST:
-       Remover  parâmetro matrix
-       Refatorar campos advanced options  
-   Blast - Sequencias proteicas com tblastn e blastp dão problema no fancy blast. 
-   RPSBLAST é RPS-BLAST 
-   Corrigir link do Download FASTA
-   Has repetition units of bases: somente números inteiros positivos > zero 
-   Get rRNAs by type - colocar em ordem alfabética  
-   transporter classification -  transporter class: não encontrado  
-   Fazer com que o painel inteiro seja clicável ou muda cor para azul  
-   Downloads - nomes de arquivos devem fazer sentido.  
-   Painel de sequencia - adicionar link FASTA
-   Downloads - Annotations:
-   Feature Table (um zipado de todos os arquivos \*.gb do report\_feature\_table\_submission.pl)
-    Extended Feature Table (um zipado de todos os arquivos all\_results.tab do report\_feature\_table\_artemis.pl)
-   GFF3 (um zipado de todos os arquivos do report\_gff.pl) 
-   ícones do KEGG e eggnog de global analyses estão quebrados  
-   Global analyses:
-       GO term (singular) mapping 
-           A frase "NOTE: Please use Mozilla Firefox, Safari or Opera browser to visualize the expansible trees. If you are using Internet Explorer, please use the links to "Table of ontologies" to visualize the results." só deve aparecer se tiver inserido link para o XML (árvore expansível). 
-       eggNOG
-           Substituir BLAST result por "Gene" nas tabelas
-       KEGG Pathways
-           Substituir BLAST result por "Gene" nas tabelas  
