/* Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: PaletaCores.blueHome(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              Container(
             /*    width: screenWidth,
                height: screenHeigth * .85, */
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: FutureBuilder(
                  future: Provider.of<Filtros>(context, listen: false)
                      .buscaFiltros(),
                  builder: (ctx, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<Filtros>(
                          child: Center(
                            child: Text(
                              'Nenhum filtro cadastrado',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: PaletaCores.black(),
                              ),
                            ),
                          ),
                          builder: (ctx, filtros, chil) => filtros
                                      .filtrosQuantidade ==
                                  0
                              ? chil
                              : ListView.builder(
                                  itemCount: filtros.filtrosQuantidade,
                                  itemBuilder: (ctx, i) => Container(
                                    height: 92,
                                    child: Card(
                                      color: PaletaCores.gray(),
                                      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: screenWidth * .67,
                                              margin: EdgeInsets.fromLTRB(
                                                  12, 0, 0, 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Modelo: ${filtros.getFiltro(i).modelo}',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Performanse: ${filtros.getFiltro(i).performanse} L/h',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                  Text(
                                                    'Preço: R\$ ${filtros.getFiltro(i).preco}',
                                                    style: TextStyle(
                                                        fontSize: 21,
                                                        color: Colors.black),
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    ); */