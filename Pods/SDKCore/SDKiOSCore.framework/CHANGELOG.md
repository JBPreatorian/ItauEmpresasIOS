## [2.1.1] - 2019-01-09
## Added
- Adicionado Pinagem SSL para a URL do ITI

## [2.1.0] - 2018-11-30
### Added
- Separa a WebView do SDKCore

## [2.0.62] - 2018-11-30
### Added
- Atualizado SDKRoutes para 1.0.3 adicionando URL da colombia

## [2.0.61] - 2018-11-05
### Added
- Função publica para webView chamada lastLocation que retorna geoLocalizacao do usuario

## [2.0.60] - 2018-10-20
### Fixed
- Remove header publicos de Criptografia para cartões

## [2.0.59] - 2018-10-19

### Fixed
- Arruma bug do "Ops" que ocorria ao clicar em voltar na tela de autenticação após aplicar poupança.
- Remove header publicos de Criptografia para cartões

## [2.0.58] - 2018-10-16
### Added
- Adiciona Pinagem

## [2.0.57] - 2018-10-11
### Added
- Adiciona classe de autenticação para Cartões

## [2.0.56] - 2018-10-10
### Added
- Sobe versão para Swift 4.1

## [2.0.55] - 2018-09-24
### Fixed
- Atualiza versão do SDK Routes para versão em Swift

### Added
- Adiciona classe IMPDFPreview que possibilita visualizar arquivos PDF de forma nativa e não mais pelo Google drive
- Adiciona classe IMUtils com método que recebe numa string um valor hexadecimal e retorna um UIColor com a cor correspondente
- Modifica classe NativeBridgePlugin para expor os métodos de visualização do PDF
- Cria e modifica os testes unitários necessários

## [2.0.54] - 2018-08-22
### Fixed
- Desfaz as alterações feitas na versão 2.0.48 do dia 31 de julho.

## [2.0.53] - 2018-08-20
### Fixed
- Atualizacao das libs de segurança: libIMTokenAuthenticator (commit c22c5a9f), libIMMiddlewareJarvis (commit c9592bbc) e libIMMiddlewareChannel (commit b622561c)

## [2.0.52] - 2018-08-13
### Fixed
- Atualizacao da libIMMiddlewareChannel para "0.0.12"

## [2.0.51] - 2018-08-03
### Fixed
- Remove chamada dupla de failure callback.
- Verifica se é possível converter json para data no request síncrono.
- Volta versão swift para 4.0

## [2.0.50] - 2018-08-01
### Added
- Corrige testes unitários
- Adiciona script de tempo de build

## [2.0.49] - 2018-07-31
### Fixed
- Sobe versão para Swift 4.1

## [2.0.48] - 2018-07-31
### Fixed
- Correção de resposta no botão voltar da tela de autenticação em poupança

## [2.0.47] - 2018-07-12
### Fixed
- Correção de lib de segurança para leitor de QRCode do ATM

## [2.0.46] - 2018-07-12
### Added
- Nova lib libIMTokenAuthenticator com leitor de QRCode do ATM
- Nova classe IMBackendClient.swift
- Nova classe QueueManager.swift
- Nova classe IMBackendClient+Token.swift

## [2.0.45] - 2018-06-14 (em validação)
### Added
- Implementação das regras do projeto Olympus Cartonista
- Nova classe IMBackendClient+TokenCitiRequest
- Inclusão de métodos para tratamento do cliente Olympus cartonista

## [2.0.44] - 2018-06-11
### Added
- Inserção de header para user agent no IMRequestManager.

## [2.0.43] - 2018-05-26
### Added
- Atualização da libIMTokenAuthenticator para versão 0.2.12 para que o token seja reconhecido pelo Teclado Itaú na versão distribution.

## [2.0.42] - 2018-04-10
### Added
- Inclusão da classe IMBackendClient_Internals e dependentes como publica.
- Ajuste do botão voltar da tela de senha eletrônica quando exibida pela webview (angular).

## [2.0.39] - 2018-04-10
### Added
- Inclusão do fluxo de validação de senha eletrônica para webview em angular.

## [2.0.37] - 2018-04-04
### Fixed
- Atualizaçao da libIMMiddlewareJarvis, para versão com pinagem.

## [2.0.36] - 2018-03-29
### Fixed
- Correção da chamada de opkeys públicas.

## [2.0.35] - 2018-03-22
### Added
- Atualizaçao da libIMMiddlewareJarvis, para versão sem pinagem.

## [2.0.34] - 2018-03-09
### Added
- Funcionalidade de analytics implementada pelo COE analytics.

## [2.0.33] - 2018-02-20
### Added
- Versão do SDK com implementações do projeto Olympus + correção de validação de senha inválida

## [2.0.32] - 2018-02-20
### Fixed
- Correção de validação de senha inválida para senha de débito e crédito (sem implementações do projeto Olympus)

## [2.0.31] - 2018-02-07
### Added
- Fluxo de instalacao de token para migracao do dos clientes do CitiBank (projeto Olympys).

## [2.0.30] - 2018-02-05
### Fixed
- Correção no fluxo de tela de senha de cartao, que causava travamento no fluxo do aporte de previdencia do angular.

## [2.0.26] - 2018-01-10
### Added
- Equalizacao do motor de risco que estava no SDK estatico, com o SDK dinamico.

## [2.0.17] - 2017-12-05
### Added
- Atualizaçao da libIMMiddlewareJarvis.

## [2.0.16] - 2017-11-29
### Added
- Atualizaçao da libIMSecureUserDefaults.

## [2.0.11] - 2017-10-27
### Added
- Tratamento do Face ID.

## [2.0.10] - 2017-10-26
### Fixed
- Correcao das rechamadas em branco que ocorrem na home do app PF.


## [1.5.33] - 2017-11-24
### Fixed
- Correções de nulidade de variáveis propensas a assumir valores nil, NSNull e inclusão da verificação do path para requests a APIs públicas.

## [1.5.32] - 2017-11-01
### Added
- Adicionando feature para validação de qual Device o app está rodando

## [1.5.30] - 2017-11-06
### Added
- FIX - remoção de correções do WebView

## [1.5.29] - 2017-11-01
### Added
- Correção lib de segurança com Xcode correto - 8.3.3

## [1.5.28] - 2017-11-01
### Added
- Validação de FaceID para iPhone X

## [1.5.25] - 2017-10-26
### Fixed
- Correção na redirectNavigation para chamada de webview em angular.
- Correção do empilhamento do objeto webview.

## [1.5.24] - 2017-10-17
### Fixed
- Ajustes na SDK para solucionar problema de envio de body vazio

## [1.5.23] - 2017-10-02
### Fixed
- Correção do carregamento de página em angular pelo método loadWithSPA

## [1.5.22] - 2017-09-22 (segurança)
### Added
- Informação de timestamp para OTP de token app logado (equipe de segurança)
- Informação de timestamp para OTP de token app não logado (equipe de segurança)

## [1.5.21] - 2017-09-13 (segurança)
### Added
- Informação de timestamp para OTP de token app logado (equipe de segurança)
- Informação de timestamp para OTP de token app não logado (equipe de segurança)

## [1.5.20] - 2017-09-13
### Fixed
- Navegação entre webview (usabilidade) e novo framework de webview.

## [1.5.19] - 2017-09-08 (suporte)
### Removed
- Inibição de chamadas de api sem opkey (equipe de suporte)

## [1.5.18] - 2017-08-25 (segurança)
### Fixed
- Remoção de dismiss que quebrava fluxo de instalação/cancelamento.

## [1.5.17] - 2017-08-23
### Removed
- Suporte ao novo framework de webview em AngularJS (core)
- Recurso para navegar entre webview (usabilidade) e novo framework de webview.

## [1.5.16] - 2017-08-14 (segurança)
### Added
- Implementação do motor de risco para a plataforma mobile iOS

## [1.5.15] - 2017-08-10
### Added
- Suporte ao novo framework de webview em AngularJS (core)
- Recurso para navegar entre webview (usabilidade) e novo framework de webview.
- Diferenciação das chamadas pelo menu ou pelo normaliza para identificação pelo router e redução de MIPS (equipe de segurança)
- Informação de timestamp para OTP de token app (equipe de segurança)

### Fixed
- Inibição de chamadas de api sem opkey (equipe de suporte)

## [1.5.14] - 2017-06-14 (segurança)
### Fixed
- Valida se os `_tokenKeySerialNumber`, do metódo `areSerialNumberInvalids` na `IMResponseSecurity.m` são inválidos (correção da "tela branca").
- Correção na leitura do QR code (`libIMCommonCryptor 0.0.7` e `libIMTokenAuthenticator 0.2.1`).

## [1.5.7] - 2017-05-15 (segurança)
### Fixed
- Leitura do token offline para clientes que atualizam o app ou transferem o token para outro device.

## [1.5.6] - 2017-05-04
### Changed
- Alteração do valor da chave para não ativar a feature “habilitar itoken app com device anterior" para quem não possui o storyboard no app.

## [1.5.5] - 2017-04-25
### Fixed
- Delegate GoBack - Remoção do delegate `IMBaseNavigationControllerImplDelegate` que implementava o metodo `-(void)goBack`.

## [1.5.4] - 2017-04-20
### Added

- Inclusão do método que decriptografa um QR code de segurança do bankline:

```objc
- (NSString *)decryptStringForTokenQRCode:(NSString *)stringToBeDecrypted;
```

### Changed
- Atualização da versão da libIMTokenManager para 0.2.0;

## [1.5.0] - 2017-03-15
### Added

- Unity Test - 94%

- Cache - Controle de cache para as requisições no backend, foi adicionado um método para especificar o tempo de duração do cache através do parâmetro  ``cacheDuration``

```objc
[[IMBackendClient sharedClient] requestWithParams:params OPKey:@"menu" cacheDuration:100 successBlock:^(IMResponse *responseObj) {
...

```
**Nota:** Se a célula que utilizar esse método, ele será armazenado em memória (RAM) e são apagadas ao fechar a aplicação e ou quando executar o logoff.

- Criação do protocolo que responde ao ser executado um *dismissViewController* na tela de SMS do fluxo de instalação, isso faz com que a *viewcontroller* (se implementado o protocolo) possa saber se o usuário apertou o back button da *navigationBar*. A implementação é através do protocolo `IMBaseNavigationControllerImplDelegate` que responde para um método `goBack`.

```objc
...
self.navigationViewController.customDelegate = self;
...

```

- Plugin WebView - Foi implementado protocolos que permitem adicionar um plugin para monitorar eventos específicos: `WebViewPreLoadEventPluginProtocol`, `WebViewLoadEventPluginProtocol`, `WebViewPostLoadEventPluginProtocol`, `WebViewPostLoadEventPluginProtocol`.
[Mais detalhes](http://gitmobile.itau/framework/sdk-ios-core).

- Redesign - Foi adicionado a compatibilidade com a versão das novas telas do SDK. Você pode selecionar através do parâmetro (`ViewControllerBundleType`) um dos valores **ViewControllerBundleDefault** ou **ViewControllerBundleNew** , isso permite que o SDK selecione automaticamente quais Views serão apresentados para o usuário.

```objc
...
[IMAppConfigurator setViewControllerBundleType:ViewControllerBundleNew];
...

```

### Changed

- Novo Sample - Implementado uma nova estrutura para o Sample, para facilitar o entendimento e os testes QA.

- Alteração do delegate NSURLSessionDelegate para IMItauWebViewURLSessionTaskDelegate - Separação dos protocolos de delegate da UIViewView para um objeto especifico.

### Fixed

- Implementação da validação dos dados relacionados com o Offer Tokens - Alguns dados são recebidos no SDKCore com valores nulos, essa implementação valida esses dados e executa uma exceção caso seja inválidos.

- Remoção do Offer Tokens - Esta feature oferece o token para quem estava na Whitelist do banco e quem processava essa informação era a arquitetura antiga de
Middlware e agora será feito direto pelo back-end.
A célula era responsável pela execução desse método após o login, e se o retorno fosse o bloco de sucesso, e mostrava uma tela forçando a instalação do token app.

- Removido dependência XMLDictionary - O oferta token por se tratar de arquitetura antiga respondia um xml, essa dependência convertia XML para JSON.

## [1.4.92] - 2016-02-15

### Changed
-  Unity Test - 81%
-  Alterações de acessibilidade no fluxo de instalação do Token.
-  Removida chave CFBundleExecutable do info.plist


## [1.4.91] - 2016-02-02
### Added

### Changed
-  Certificado de segurança.

## [1.4.90] - 2016-01-27
### Added

- APIS Públicas - Para configurar os endpoints das APIs públicas, utilize o método `setupRoutes:error`, como no exemplo a seguir:

```objc
error = nil;
NSDictionary *routes = @{@"paRemoteBundle": @"/remoteBundle",
@"paVersionControl": @"/versionControl",
@"paServerDateTime": @"/serverDateTime"};

[[IMBackendClient sharedClient] setupRoutes:routes error:&error];
```

onde a chave é definida pelo usuário e o valor é o `path` que será anexado na [URL](#diferenca-desenv-prod) de APIs públicas.

As chamadas para as APIs públicas são feitas com o mesmo método em que se faz as requisições com opKeys do IMBackendClient, ou seja, com o método `requestWithParams:OPKey:successBlock:failureBlock`. Neste caso, no parâmetro `OPKey` deve-se passar a chave definida na configuração dos endpoints.


### Changed
-  Unity Test - 73%

### Fixed
- Tela Branca - Quando o usuário não possuia nenhum dispositivo de segurança habilidato, o SDK exibia uma tela em branco.


## [1.4.89] - 2016-01-10
### Changed
-  Unity Test - 70%

### Fixed
- Inconsitência no tratamento de erro na validação do Token.

## [1.4.88] - 2016-11-06
### Added
- Enviar parâmetros via SDK para a ItauWebView e da ItauWebView para o SDK;
- Agora é possível habilitar o TokenApp caso possua TokenApp em dispositivo anterior.
### Changed
-  Unity Test - 66%

## [1.4.87] - 2016-10-12
### Added
- Clientes que estão na White List, agora conseguem instalar o iToken através da senha do cartão.

### Changed
- Cobertura dos testes unitários em 60%

## [1.4.86] - 2016-10-01
### Added
- Retirar obrigatoriedade de token SMS para cadastramento do Token APP (Habilitação via CEI)
- Oferta de token para clientes PF

```objc
- (void)shouldOfferTokenAppForWhiteListWithSucessBlock:(NSDictionary *)userInfo
successBlock:(IMCompletionBlock)successBlock
failureBlock:(IMCompletionBlock)failure;
NSDictionary *userInfo = @{
IMAgencia    : @"1500",
IMConta      : @"05201",
IMDac        : @"2",
IMTipoUsuario       : @"H",
IMCPF        : @"27862732855",
IMTitular    : @"000018",
IMCanal      : @"PF",
IMCanalOrg   : @"PF",
IMSegmento   : @"P"
};

```

### Changed
- Por segurança, não mantém mais o cache das requisições na webivew;
- Aumento da cobertura dos testes unitários para 54%.

### Fixed
- Correção do método HandleError para tratatamento do erro -999 na requisição de URLs.

## [1.4.85] - 2016-09-18
### Added
- Exposição de um método de criptografia - este método pode ser utilizado, por exemplo, para criptografia de dados sensíveis no Realm.

### Changed
- MiddlewareChannel como novo certificado SSL;

### Fixed
- Correção do método HandleError para tratatamento do erro -999 na requisição de URLs.
