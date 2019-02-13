# SDKiOS

## [Wiki](http://gitmobile.itau/framework/sdk-ios-core/wikis/home)
Boas práticas e instruções para desenvolvedores do SDK iOS.

## [Changelog](http://gitmobile.itau/framework/sdk-ios/blob/master/CHANGELOG.md)
Relação de correções e alterações no componente de SDK iOS. 

## Instalação

O SDKiOS está disponível via [CocoaPods](http://cocoapods.org).
Para instalar é necessário adicionar o repositório de specs do banco, recomendado adicionar esse spec com o nome itau conforme comando abaixo:

```ruby
pod repo add itau
```

Feito isso basta adicionar as linhas abaixo no seu Podfile e rodar o `pod install`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'git@gitmobile.itau:framework/pod-specs.git'

pod 'SDKiOS'
```

## Pods incluídos como dependência no Core

- [AFNetworking](http://afnetworking.com)
- [AFNetworkActivityLogger](https://github.com/AFNetworking/AFNetworkActivityLogger)
- [AdobeMobileSDK](https://github.com/Adobe-Marketing-Cloud/mobile-services/releases/)
- [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack)
- [libextobjc](https://github.com/jspahrsummers/libextobjc)
- [Mantle](https://github.com/Mantle/Mantle)
- [ObjectiveSugar](https://github.com/supermarin/ObjectiveSugar)
- [XMLDictionary](https://github.com/nicklockwood/XMLDictionary)

## Router, Integrada, Mockada, OPKey

- ROUTER: O SDK se comunica diretamente com o Router. Essa comunicação é chamada no SDK de Router e é controlada pelo parametro routerURL.
- OPKey: O router funciona com endpoint único. Para que seja possivel saber qual a operação desejada, usamos um identificador chamado OPKey. Para saber quais opkeys utilizar, procure seu líder de projeto.

- INTEGRADA e MOCKADA: são tipos de ROUTER
- INTEGRADA: se refere a um router que se comunica com a API integrada do banco. Verifica com seu líder de projeto qual routerURL utilizar.
- MOCKADA: se refere a um router que se comunica com a API mockada do Swagger. Verifica com seu líder de projeto qual routerURL utilizar.

## Token

Para chamadas que necessitem de Token, o SDK irá automaticamente interceptar a chamada, exibir a tela de token e validar o token fornecido pelo usuário. Esse tratamento é transparente ao client do SDK.

## Configurações do SDK

### URLs

O SDK define automaticamente as URLs e elas variam dependendo se está em modo de `desenvolvimento` ou `produção`. Caso o SDK esteja em modo de desenvolvimento, é possível alterá-las, exemplo:

```objc
NSError *error = nil;
NSDictionary *setup = @{IMSetupUsabilityURLKey : [NSURL URLWithString:@"https://bankline.itau.com.br/vsnet/wap2/mobile.asp"],
                        IMSetupRouterURLKey : [NSURL URLWithString:@"http://mobile.itau.com.br/router-app/router/mobile"],
                        IMSetupPublicURLKey: [NSURL URLWithString:@"https://mobile.itau.com.br/router-app/router/public"],
                        IMSetupMiddlewareStringKey : @"https://ww70.itau.com.br/pcms/middleware.svc/",
                        IMSetupWebviewURLKey: [NSURL URLWithString:@"<URL para Single Page Apps>"]};

[[IMBackendClient sharedClient] setupParams:setup error:&error];
```

### APIs Públicas

Para configurar os endpoints das APIs públicas, utilize o método setupRoutes:error, como no exemplo a seguir:

```objc
error = nil;
NSDictionary *routes = @{@"paRemoteBundle": @"/remoteBundle",
                       @"paVersionControl": @"/versionControl",
                       @"paServerDateTime": @"/serverDateTime"};

[[IMBackendClient sharedClient] setupRoutes:routes error:&error];
```

onde a chave é definida pelo usuário e o valor é o `path` que será anexado na `URL` de APIs públicas.
As chamadas para as APIs públicas são feitas com o mesmo método em que se faz as requisições com opKeys do IMBackendClient, ou seja, com o método `requestWithParams:OPKey:successBlock:failureBlock`. Neste caso, no parâmetro `OPKey` deve-se passar a chave definida na configuração dos endpoints.

### Diferença entre modo de Desenvolvimento e Produção do SDK

O SDK iOS possui dois estados, desenvolvimento e produção, fornecendo uma certa flexibilidade no momento em que as células estão testando as devidas funcionalidades. 

A decisão de definir um modo ou outro está diretamente ligada aos ambientes nos quais os aplicativos foram publicados. Esta checagem, por sua vez, foi inspirada na biblioteca do  [HockeyApp](https://github.com/bitstadium/HockeySDK-iOS), que é open source e está disponibilizada no [Github](https://github.com/bitstadium/HockeySDK-iOS). No SDK, a classe responsável por esta checagem é a  `IMRunningEnvironment.h` e os métodos são `IMREnvironmentIsProduction()`, `IMREnvironmentIsDevelopment()` e `IMREnvironmentParamsShouldBeEncrypted()`.

As diferenças no comportamento do SDK nestes dois cenários são:

|                                                                                                                           | Desenvolvimento                                                                                                                     | Produção                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ambiente                                                                                                                  | Simulador, HockeyApp                                                                                                                | TestFlight, Appstore                                                                                                                                 |
| logs do SDK                                                                                                               | sim                                                                                                                                 | não                                                                                                                                                  |
| enviar e receber payload NÃO criptografado por default / poder alterar essa opção na classe IMClientParams (cryptoEnabled) para cada chamada | sim, exceto no caso no qual a URL do Router aponte para mobile.itau.com.br ou piloto.itau.com.br                                    | não                                                                                                                                                  |
| permite alterar as URLs                                                                                                   | sim                                                                                                                                 | não (exceto para Single Page Apps)                                                                                                                                                 |
| URL default                                                                                                              |http://jarvisinternet.itau/router-app/router/mobile<br>http://jarvisinternet.itau/router-app/router/public<br>https://ww167.itau/vsnet/wap2/mobile.asp<br>http://ww33.itau/pcms/Middleware.svc/ | https://mobile.itau.com.br/router-app/router/mobile<br>https://mobile.itau.com.br/router-app/router/public<br>https://bankline.itau.com.br/vsnet/wap2/mobile.asp<br>https://ww70.itau.com.br/pcms/Middleware.svc/ |
| SSL Pinning                                                                                                               | não                                                                                                                                 | sim                                                                                                                                                  |
| get Flow no IMResponse (exceto as que comecem com "_")                                                                     | sim                                                                                                                                 | não                                                                                                                                                  |

# <a name="fluxos-framework"></a> Fluxos relacionados ao SDK e Backend

Mais informações [aqui](http://gitmobile.itau/framework/docs/wikis/Arquitetura-SDK).






## Inicializando o App

O SDKiOS disponibiliza um método para realizar configurações gerais do app. Na versão atual, é feita apenas a configuração dos logs para utilizar CocoaLumberjack em desenvolvimento e desabilitar logs em produção. Para que isso funcione, é necessário chamar o método `+ configureAppWithActivationKey:andLicensePath:` da classe `IMAppConfigurator`. Deve ser informado a activation key e o nome do arquivo de licença para criptografia. Para ter acesso a esses parametros, procure seu lider técnico.

Não é necessário inicializar o `IMBackendClient`. Apenas em desenvolvimento, se for necessário configurar algum endereço diferente do padrão para os servidores o cliente pode ser inicializado com um dos seguintes métodos.

```ruby

+ (instancetype)initWithRoutes:(NSDictionary *)routes;


```

A inicialização do client com estes métodos em produção gerará uma exception.
Recomenda-se realizar estar configurações no `application:didFinishLaunchingWithOptions:` conforme exemplo abaixo.


Atualmente, existem dois tipos de bundle que podem ser utilizados:
O bundle default, utilizado por padrão, é o que sempre foi utilizado
```objc
[IMAppConfigurator setViewControllerBundleType:ViewControllerBundleDefault];
```

Ou, o bundle novo, que contém as telas inicialmente feitas para as demandas o ItauCard.
```objc
[IMAppConfigurator setViewControllerBundleType:ViewControllerBundleNew];
```
OBS: No futuro, esta alreação será feita a partir do pod de interface utilizado.

```objc

#import "AppDelegate.h"
#import <sdk-ios-core/SDKiOSCore.h>

NSString *const kRouterDevBaseURL = @"http://10.77.138.8:8080/router-app/router";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Configura logs em debug para usar CocoaLumberjack
    // Para ter o log colorido é necessário instalar o plugin XcodeColors via Alcatraz
    [IMAppConfigurator configureAppWithActivationKey:@"ACTIVATION_KEY" andLicensePath:@"//filepath"];

    // Define se será utilizado o novo modelo visual
    [IMAppConfigurator setViewControllerBundleType:ViewControllerBundleNew];
    // ou, para utilizar o padrão, que é definido por padrão
    // [IMAppConfigurator setViewControllerBundleType:ViewControllerBundleDefault];

    // Configuração para build de teste/debug com URLs customizadas

    NSDictionary *routes = @{
        @"teclado"   : @"/login/empresas/teclado_virtual",
        @"logon"     : @"/login/empresas/autenticacao",
        @"listarContasOperador" : @"/operadores/{codigo_operador}/contas"
    };

    NSURL *routerURL = [NSURL URLWithString:kRouterDevBaseURL];
    [IMBackendClient initWithRoutes:routes routerURL:routerURL lightURL:nil];

    // O SDK detecta automaticamente o ambiente do build e usa a URL do ambiente correto
    // Atenção que para build com certificado enterprise que serão considerados produção sempre

    // Obs: o IMBackendClient só deve ser inicializado uma vez, para recuperá-lo após a inicialização
    // deve ser utilizado o método `sharedClient` como `[IMBackendClient sharedClient]`.

    // O sharedClient do IMBackendClient possui uma propriedade reachabilityManager
    // para monitoramento de conexão com a internet. Essa é uma property do tipo
    // AFNetworkReachabilityManager e pode ser acessada de forma a setar block de mudança de estado
    // de conexão via `- setReachabilityStatusChangeBlock:`
    // Verificar a documentação do AFNetworking para mais detalhes.

    return YES;
}

@end

```

## Modelo de dicionário de configuração de endpoints para API Light

```objc

@{
    @"teclado"   : @"/login/empresas/teclado_virtual",
    @"logon"     : @"/login/empresas/autenticacao",
    @"listarContasOperador" : @"/operadores/{codigo_operador}/contas"
}

```

## Modelo de dicionário de parâmetros para requests

O modelo abaixo é o modelo baseado em dicionário que estava em uso nas primeiras versões do SDK.
Atualmente o SDK espera receber um objeto do tipo `IMClientParams` nas chamadas de rede.
O dicionário original continua exibido abaixo para fins ilustrativos. Atualmente é possível setar
method, query, path, header e body diretamente na instância do `IMClientParams`.
Para manter a compatibilitade, o SDK fornece uma categoria de NSDictionary com o método `- im_cliParams`
que dado um NSDictionary retorna o respectivo IMClientParams.

```objc

@{
    // obrigatório
    @"method" : @"GET | POST | PUT | PATCH | DELETE",

    // opcional
    @"query": @{ @"key"   : @"valor da chave do query parameter : NSString",
                 @"value" : @"valor do query parameter : NSString" },

    // opcional
    @"path": @{ @"key"   : @"chave do path component : NSString",
                @"value" : @"valor do path component : NSString" },

    // opcional
    @"header" : @{ @"key"  : @"valor da chave do header customizado : NSString",
                   @"value" : @"valor do header customizado : NSString" },

    // opcional
    @"body": @{} // NSDictionary para ser serializado e enviado como JSON body
}

```

## Modelos de chamadas a API Light e Router

```objc

- (void)executePreLogin
{
    NSDictionary *params =
    @{ @"method" : @"POST",
       @"query"  : @{},
       @"path"   : @{},
       @"header" : @{},
       @"body"   : @{@"pre-login" : @"pre-login",
                     @"tipoLogon" : @"50",
                     @"usuario.operador" : @"123456789" } };

    @weakify(self);

    [self.client requestWithFormURLEncodedParams:params OPKey:nil
    successBlock:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {

        @strongify(self);
        DDLogWarn(@"Completado com data: %@",responseObject);
        self.operador = responseObject[0][@"codigoOperador"];

    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

       DDLogError(@"erro: %@",error.localizedDescription);
       [SVProgressHUD showErrorWithStatus:error.localizedDescription];        
    }];
}

- (void)askForKeyboard
{
    NSDictionary *params =
    @{ @"method" : @"POST",
       @"query"  : @{},
       @"path"   : @{},
       @"header" : @{},
       @"body"   : @{@"operador" : @"123456789"} };

    @weakify(self);
    [self.client requestWithJSONParams:params OPKey:@"teclado"
    successBlock:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

        @strongify(self);
        DDLogWarn(@"Completado com data: %@",responseObject);
        self.idTeclado = responseObject[@"id_teclado"];

    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

        DDLogError(@"erro: %@",error.localizedDescription);
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)lightAskForKeyboard
{
    NSDictionary *params =
        @{ @"method" : @"GET",
           @"query"  : @{@"codigo_operador" : @"892363568"},
           @"path"   : @{},
           @"header" : @{},
           @"body"   : @{} };

    @weakify(self);
    [self.client requestWithJSONParams:params OPKey:@"teclado"
      successBlock:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

          @strongify(self);
          DDLogWarn(@"Completado com data: %@",responseObject);
          self.idTeclado = responseObject[@"id_teclado"];

      } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

          DDLogError(@"erro: %@",error.localizedDescription);
          [SVProgressHUD showErrorWithStatus:error.localizedDescription];
      }];
}

- (void)performLogon
{
    if (!_operador) {
        [SVProgressHUD showErrorWithStatus:@"Pré-login não realizado"];
        return;
    }
    if (!_idTeclado) {
        [SVProgressHUD showErrorWithStatus:@"Teclado não solicitado"];
        return;
    }

    NSDictionary *params =
    @{ @"method" : @"POST",
       @"query"  : @{},
       @"path"   : @{},
       @"header" : @{},
       @"body"   : @{ @"operador"   : _operador,
                      @"senha"      : @"E3G671D21OIU70",
                      @"id_teclado" : _idTeclado } };

    [self.client requestWithFormURLEncodedParams:params OPKey:@"logon"
    successBlock:^(AFHTTPRequestOperation *operation, NSArray *responseObject) {

        DDLogWarn(@"Completado com data: %@",responseObject);

    } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

        DDLogError(@"erro: %@",error.localizedDescription);
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];        
    }];
}

- (void)askForUserMenu
{
    NSDictionary *params =
    @{ @"method" : @"POST",
       @"query"  : @{},
       @"path"   : @{},
       @"header" : @{},
       @"body"   : @{}};

    [self.client requestWithJSONParams:params OPKey:@"menu"
      successBlock:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

          DDLogWarn(@"Completado com data: %@",responseObject);

      } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

          DDLogError(@"erro: %@",error.localizedDescription);
          [SVProgressHUD showErrorWithStatus:error.localizedDescription];
      }];
}

- (void)askForUserAccounts
{
    NSDictionary *params =
    @{ @"method" : @"POST",
       @"query"  : @{},
       @"path"   : @{},
       @"header" : @{},
       @"body"   : @{}};

    [self.client requestWithJSONParams:params OPKey:@"listarContasOperador"
      successBlock:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

          DDLogWarn(@"Completado com data: %@",responseObject);

      } failureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {

          DDLogError(@"erro: %@",error.localizedDescription);
      }];
}

```

## WebView/JavaScript Native Plugin
O componente WebView, 'IMItauWebView' passou a suportar plugins para diferentes fases do cliclo de vida da WebView.

## Compartilhando Dados Célula <-> WebView
O Mecanismo permite a troca de dados entre célula e webview.

```objc
#import <SDKiOSCore/SDKiOSCore.h>
#import "MemoryStorageWebView+KeyValue.h"

// Acessa o objeto MemoryStorageWebView, através do qual a Célula pode guardar dados, na forma
// chave e valor, para ser acessível via a WebView, utilizando o valor como {chave}
MemoryStorageWebView *memoryStorageWebView = [SDKContext sharedContext].memoryStorageWebView;
// Armazena o valor. Este valor poderá ser acessado na webview como {key}
[memoryStorageWebView saveValue:@"value" usingKey:@"key"];
```

Esta chave pode ser utilizada para valores sensíveis, como, por exemplo `{id_conta}`, `{agencia}`, etc. 

Devido à natureza sensível destas informações, o armazenamento da mesma deve ser feito de forma explícita pela célula. O SDK não armazena, processa ou deriva qualquer dado trafegado pela célula.

A Interface MemoryStorageWebView disponibiliza estes métodos:

```objc
- (void)saveValue:(NSString *)value usingKey:(NSString *)key;
- (NSString *)findValueUsingKey:(NSString *)key;
- (void)clearAll;
- (void)saveAll:(NSDictionary <NSString *, NSString *> *)values;

- (NSString *)objectForKeyedSubscript:(NSString *)key;
- (void)setObject:(NSString *)obj forKeyedSubscript:(NSString *)key;
```

O primeiro plugin dizponibilizado permite que JavaScript faça chamadas ao código nativo, especificando qual a função callback será utilizada para lidar com o retorno da requisição.

```html
<!DOCTYPE html>
<html>
<body>
<p>Click the button to display an alert box:</p>
<button onclick="myFunction()">Try it</button>
<script>
  function myFunction() {
      var request = '
			{
			  body: {},
			  op : saldo,
			  header: [],
			  method: GET,
			  path: [{
			    key: id_conta,
			    value: {id_conta}
			  }],
			  query: [{id_conta}]
			}';
      native.routerRequest(request, 'callback');
  }

  function callback(request, response, error) {
      var msg = "request: " + request;
          msg = "\n";
          msg = "response: " + response;
          msg = "\n";
          msg = "error: " + error;
        document.getElementById('response').innerHTML = response;
        document.getElementById('error').innerHTML = error;
  }

</script>
<br/>
Response: <div id="response"></div><br/>
Error: <div id="error"></div><br/>
</body>
</html>
```

É possível notar no JSON da operação o parâmetero {id_conta}. Este parâmetro é um parâmetro que a WebView não possui. Parâmetros do tipo {NOME} serão substituídos pelo plugin.

O plugin o buscará no objeto 'MemoryStorageWebView', acessível a partir do objeto 'SDKContext', utilizado para evitar a proliferação de Singletons no SDK.

```objc
#import <SDKiOSCore/SDKContext.h>
#import <SDKiOSCore/MemoryStorageWebView.h>

(...)
MemoryStorageWebView *memoryStorageWebView = [SDKContext sharedContext].memoryStorageWebView;
// define o valor para a chave
memoryStorageWebView[@"chave"] = @"valor";
// obtém o valor da chave
memoryStorageWebView[@"chave"]
(...)
```


## Navegar entre sistemas webview
É possível navegar entres o sismteas de webview (usabilidade e SinglePageApplication).
No Sdk existe o método `redirectNavigation` que pode ser acessado via javascript pela pagina webview.
segue um exemplo de chamada para navegar do sistema SPA para Usabilidade:

Agora segue um exemplo de navegação do sistema Usabilidade para SPA

```html
<!DOCTYPE html>
<html>
<head>
    <script>
        function navigate() {
            native.redirectNavigation('usabilidade', 'idServ');
        }
    </script>
</head>

<body>
<h1 id="request"></h1>
<button id="button" onclick="navigate();">chama webview usabilidade</button>
</body>
</html>
```

Agora segue um exemplo de navegação do sistema Usabilidade para SPA

```html
<!DOCTYPE html>
<html>
<head>
    <script>
        function navigate() {
            native.redirectNavigation('spa', 'path');
        }
    </script>
</head>

<body>
<h1 id="request"></h1>
<button id="button" onclick="navigate();">chama webview spa</button>
</body>
</html>
```

## Cache de requisições
O SDK pode gerenciar um cache interno, para evitar que chamadas idênticas sucessivas sejam feitas ao router, economizando tráfego de dados desnecessário.

Existem dois parâmetros dentro do objeto `IMClientParams`:

- `cacheDuration`: responsavel por indicar, em milisegundos, por quanto tempo o cache deverá existir. Ele tem como valor default 5 minutos, ou seja, se o time não for informado o cache existirá por 5 minutos.
- `cacheStorage `: possibilita escolher o local do cache, os valores possíveis são `IMLocalStorageMemory` ou `IMLocalStorageDisk`, se o valor do cacheLocation for IMLocalStorageDisk e o time for menor ou igual a 300000 milisegundos (5 minutos) então o cache sera feito em memória ignorando o valor do cache location.

## Geolocalização
É possível obter a localização do aparelho de forma segura através da propriedade `lastLocation` IMBackendClient:

```objc
 IMLocation *lastLocation = [IMBackendClient sharedClient].lastLocation;
```
Obs.: para esta funcionalidade, o usuário precisa ter dado permissão para geolocalização no iPhone/iPad.
