import 'package:beats/src/models/producto_model.dart';
import 'package:beats/src/services/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosP = Provider.of<ProductosProvider>(context);
    print('cantidad Productos');
// print(productosP.productos.length);

final listaWidgetProductos = productosP.productos.map((prod) =>
           _Card(prod)
          // print('producto');
          //  print(prod.color)
        ).toList();


    return Container(
      width: double.infinity,
      height: 460,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        

        children: listaWidgetProductos,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  ProductoModel producto;
  _Card(this.producto);

  @override
  Widget build(BuildContext context) {
  

    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _PrimeraDescripcion(producto),
              SizedBox(
                width: 55.0,
              ),
              _TarjetasDescripcion(producto)
            ],
          ),
          Positioned(
              top: 90,
              left: 50,
              child: Image(
                image: AssetImage('assets/${producto.url}'),
                width: 160.0,
              ))
        ],
      ),
    );
  }
}

class _PrimeraDescripcion extends StatelessWidget {
 ProductoModel producto;
  _PrimeraDescripcion(this.producto);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${producto.bateria} hour Battery',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              width: 30.0,
            ),
            Icon(FontAwesomeIcons.wifi, size: 15),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Wireles',
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

class _TarjetasDescripcion extends StatelessWidget {
   ProductoModel producto;
  _TarjetasDescripcion(this.producto);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          height: 340.0,
          color: Color(producto.color),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      '${producto.titulo}',
                      style: TextStyle(
                          color: Colors.white24,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                       '${producto.subtitulo}',
                      style: TextStyle(
                          color: Colors.white24,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${producto.nombre}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text('\$349.95',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    width: 80,
                  ),
                  Container(
                    width: 120.0,
                    height: 45,
                    child: Center(
                      child: Text('add bag',
                          style: TextStyle(color: Colors.white)),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
