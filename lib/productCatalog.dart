import 'package:flutter/material.dart';

class ProductCatalog extends StatefulWidget {
  @override
  _ProductCatalogState createState() => _ProductCatalogState();
}

final List<String> imageList = [
  'https://cdn.shopify.com/s/files/1/2551/9654/products/566MF-G1F394_1024x1024.jpg?v=1581956963',
  'https://www.caseformula.com/media/catalog/product/cache/samsung-galaxy-note-10-lite-clear-case_1-image-1000x1000/00393449-adidas-samsung-galaxy-note-10-lite-clear-case_1.jpg',
  'https://www.teleplus.nl/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/s/a/samsung_galaxy_s10_lite_kilif_luks_mat_silikonnl253469784783-DM1KMbDcG0s65o9u.jpg',
];

class _ProductCatalogState extends State<ProductCatalog> {
  String _selectedImage = imageList[0];
  final TransformationController transfrom = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: <Widget>[
          Text(
            'Product Catalog',
            style: TextStyle(fontSize: 40),
          ),
          Text('Samsung Note10 Lite'),
          Expanded(
              child: InteractiveViewer(
                  maxScale: 4,
                  transformationController: transfrom,
                  onInteractionEnd: (detail) {
                    transfrom.value = Matrix4.identity();
                  },
                  child: Image.network(_selectedImage))),
          Container(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedImage = imageList[index];
                          transfrom.value = Matrix4.identity();
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(2),
                          color: Colors.red,
                          child: Image.network(imageList[index])),
                    );
                  }))
        ]),
      )),
    );
  }
}
