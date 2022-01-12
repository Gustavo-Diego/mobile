import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobile/app/modules/home/home_status.dart';
import 'package:mobile/app/modules/home/models/sonho.dart';

import 'package:mobile/app/modules/shared/utilities/constants.dart';
import '../home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  // controle de estado da 4 telas do bottombar
  final pageController = PageController();
  int get indexPage => pageController?.page?.round() ?? 0;
//////////////////////////////////////////////////////////////////////////


  Widget _apresentacao() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Olá,',
            style: styleTextApresentacao,
          ),
          SizedBox(height: 10.0),
          Text(
            'Mariana!',
            style: styleTextApresentacao,
          ),
        ]),
        InkWell(
          onTap: () => {},
          child: Icon(Icons.people),
        ),
      ],
    );
  }

  Widget _boxInvestimentoTotal() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: styleBoxTotalInvestimento,
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Você já investiu", style: styleletra),
              Text("Seu dinheiro já rendeu", style: styleletra),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("R\$ 3.200,00", style: styleletra),
              Text("R\$ 250,35", style: styleletra),
            ],
          ),
        ],
      ),
    );
  }

// lista de sonhos que precisa ser arruma ainda 
  Widget _listaSonhos() {

    return 
     Observer(builder: (_) {
        if( controller.status == HomeStatus.loading ){
          return Center(
            child: CircularProgressIndicator()
          );
        } else if (controller.status == HomeStatus.success){
          final list = controller.status.value as List<Sonho>;
          if(list.isNotEmpty){
            return 
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(list[index].nome),
              )
            );
          }else{
            Text("lista vazia");
          }
        } else if (controller.status == HomeStatus.error){
          return Text("${controller.status.value}");
        }
      }
      );

    //  ListView.builder(
    //     itemCount: 1,
    //     itemBuilder: (context, index) {
    //       // final sonh = widget.sonho[index];
    //       return ListTile(
    //         title: Text("teste"),
    //         subtitle: Text("teste"),
    //       );
    //     });

  }

  Widget _disponivelCarteira() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Disponível na carteira',
            style: styleTextlongo,
          ),
          SizedBox(height: 10.0),
          Text(
            'R\$ 1.100,00',
            style: styleTextlongo,
          ),
        ]),
        InkWell(
          onTap: () => {},
          child: Icon(Icons.people),
        ),
      ],
    );
  }

  Widget _pesquisarInvestimento() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: styleBoxPesquisaInvestimento,
      height: 40.0,
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
          color: corLetraCinzaEscuro,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 8.0),
          prefixIcon: Icon(
            Icons.search,
            color: corLetraCinzaEscuro,
          ),
          hintText: 'Procure seu investimento',
          hintStyle: styleletra,
        ),
      ),
    );
  }

     Widget _listaTodosInvestimento1() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: styleBoxTotalInvestimento,
        height: 160.0,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("CDI 138%", style:styleTextLetraInvestimento1),
              Text("BANCO DO BRASIL", style:styleTextLetraInvestimento2),
              Text("VENCIMENTO 31/10/2021", style:styleTextLetraInvestimento1),
              SizedBox(height: 10.0),
              Text("VALOR MÍNIMO R\$ 500,00", style:styleTextLetraInvestimento1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                    // padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: 120,
                    child: RaisedButton(
                      elevation: 7.0,
                      onPressed: () => Modular.to.pushNamed('/ConfirmarInvestimento'),
                      padding: EdgeInsets.all(3.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: corSecundaria,
                      child: Text(
                        'SIMULAR',
                        style: TextStyle(
                          color: corFundo,
                          letterSpacing: 1.2,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]));
  }

  Widget _listaTodosInvestimento2() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: styleBoxTotalInvestimento,
        height: 160.0,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("CDI 138%", style:styleTextLetraInvestimento1),
              Text("BANCO DO BRASIL", style:styleTextLetraInvestimento2),
              Text("VENCIMENTO 31/10/2021", style:styleTextLetraInvestimento1),
              SizedBox(height: 10.0),
              Text("VALOR MÍNIMO R\$ 500,00", style:styleTextLetraInvestimento1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                    // padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: 120,
                    child: RaisedButton(
                      elevation: 7.0,
                      onPressed: () => Modular.to.pushNamed('/ConfirmarInvestimento'),
                      padding: EdgeInsets.all(3.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: corSecundaria,
                      child: Text(
                        'SIMULAR',
                        style: TextStyle(
                          color: corFundo,
                          letterSpacing: 1.2,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]));
  }

  Widget _listaTodosInvestimento3() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: styleBoxTotalInvestimento,
        height: 160.0,
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("CDI 138%", style:styleTextLetraInvestimento1),
              Text("BANCO DO BRASIL", style:styleTextLetraInvestimento2),
              Text("VENCIMENTO 31/10/2021", style:styleTextLetraInvestimento1),
              SizedBox(height: 10.0),
              Text("VALOR MÍNIMO R\$ 500,00", style:styleTextLetraInvestimento1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                    // padding: EdgeInsets.symmetric(vertical: 10.0),
                    width: 120,
                    child: RaisedButton(
                      elevation: 7.0,
                      onPressed: () => Modular.to.pushNamed('/ConfirmarInvestimento'),
                      padding: EdgeInsets.all(3.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: corSecundaria,
                      child: Text(
                        'SIMULAR',
                        style: TextStyle(
                          color: corFundo,
                          letterSpacing: 1.2,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]));
  }

  Widget _saldoTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(
            'Seu saldo é',
            style: styleTextApresentacao,
          ),
          SizedBox(height: 10.0),
          Text(
            'R\$ 3.200,00',
            style: styleTextApresentacao,
          ),
        ]),
        InkWell(
          onTap: () => {},
          child: Icon(Icons.people),
        ),
      ],
    );
  }

  Widget _depositarResgatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      _botaoDepositar(),
      _botaoResgatar()
    ]);
  }

  Widget _botaoDepositar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: 130,
      child: RaisedButton(
        elevation: 2.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
          InkWell(
            child: Icon(Icons.arrow_upward, color: corSecundaria, size: 35),
          ),
          Text(
            'DEPOSITAR',
            style: TextStyle(
              color: corSecundaria,
              letterSpacing: 1.2,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ]),
      ),
    );
  }
  
  Widget _botaoResgatar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: 130,
      child: RaisedButton(
        elevation: 2.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
          InkWell(
            child: Icon(Icons.arrow_downward, color: corSecundaria, size: 35),
          ),
          Text(
            'RESGATAR',
            style: TextStyle(
              color: corSecundaria,
              letterSpacing: 1.2,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[

          // pagina principal
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                          child: Container(
                            color: corSecundaria,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _apresentacao(),
                          SizedBox(height: 25.0),
                          _boxInvestimentoTotal(),
                          SizedBox(height: 25.0),
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: Container(
                              child: Scaffold(
                                body: _listaSonhos()
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // pagina dos investimento
  AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                          child: Container(
                            color: corSecundaria,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _disponivelCarteira(),
                          SizedBox(height: 15.0),
                          _pesquisarInvestimento(),
                          SizedBox(height: 20.0),
                          _listaTodosInvestimento1(),
                          SizedBox(height: 20.0),
                          _listaTodosInvestimento2(),
                          SizedBox(height: 20.0),
                          _listaTodosInvestimento3(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // pagina dos carteira
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                          child: Container(
                            color: corSecundaria,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _saldoTotal(),
                          _depositarResgatar(),
                          //_graficoPizza()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // página de perfil de usuário 
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 4,
                          width: double.infinity,
                          child: Container(
                            color: corSecundaria,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 40.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 200,
                            height: 100,
                            child: Container(
                              child: Scaffold(
                                // body:_listaInvestimentos()
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          
          
        ],
      ),
       bottomNavigationBar: AnimatedBuilder(
          animation: pageController,
          builder: (_, __) {
            return BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              onTap: (index) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              currentIndex: indexPage,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: corSecundaria, size: 25),
                    title: Text('Home', style: TextStyle(color: corSecundaria)),
                    activeIcon:
                        Icon(Icons.home, color: corSecundaria, size: 35)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance,
                        color: corSecundaria, size: 25),
                    title: Text('Investir',
                        style: TextStyle(color: corSecundaria)),
                    activeIcon: Icon(Icons.account_balance,
                        color: corSecundaria, size: 35)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.monetization_on,
                        color: corSecundaria, size: 25),
                    title: Text('Carteira',
                        style: TextStyle(color: corSecundaria)),
                    activeIcon: Icon(Icons.monetization_on,
                        color: corSecundaria, size: 35)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: corSecundaria, size: 25),
                    title:
                        Text('Perfil', style: TextStyle(color: corSecundaria)),
                    activeIcon:
                        Icon(Icons.person, color: corSecundaria, size: 35))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/CriarSonho'),
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );

  }
}
