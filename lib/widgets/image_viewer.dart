import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../core/consts/asset_path.dart';
import '../features/my_invoices/service/invoice_pdf_service.dart';

enum ImageViewType {
  network,
  file,
  memory,
}

class ImageViewer<T> extends StatefulWidget {
  const ImageViewer({
    Key? key,
    this.initialPage = 0,
    required this.imageList,
    required this.type,
  })  : assert(
  (T is File || type == ImageViewType.file) ||
      (T is Uint8List || type == ImageViewType.memory) ||
      (T is String || type == ImageViewType.network),
  "Type And File Mismatch"),
        super(key: key);
  final List<T> imageList;
  final ImageViewType type;
  final int initialPage;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  final _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      if (_doubleTapDetails != null) {
        final position = _doubleTapDetails!.localPosition;
        _transformationController.value = Matrix4.identity()
          ..translate(-position.dx, -position.dy)
          ..scale(3.0);
      }
    }
  }

  int selectedImageIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedImageIndex = widget.initialPage;
  }

  onChangedIndex(int val) {
    setState(() {
      selectedImageIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
        actions: [
          if (widget.type == ImageViewType.memory)
            IconButton(
              onPressed: () {
                InvoicePdfServices.download(
                  widget.imageList[selectedImageIndex],
                  fileName: "image.png",
                  desc: "Image Downloaded",
                );
              },
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.white,
              ),
            ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider(
          items: () {
            switch (widget.type) {
              case ImageViewType.memory:
                return widget.imageList
                    .map(
                      (e) => GestureDetector(
                    onDoubleTapDown: _handleDoubleTapDown,
                    onDoubleTap: _handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      child: Image.memory(
                        e,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                    .toList();
              case ImageViewType.file:
                return widget.imageList
                    .map(
                      (e) => GestureDetector(
                    onDoubleTapDown: _handleDoubleTapDown,
                    onDoubleTap: _handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      child: Image.file(
                        e,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                    .toList();

              case ImageViewType.network:
                return widget.imageList
                    .map(
                      (e) => GestureDetector(
                    onDoubleTapDown: _handleDoubleTapDown,
                    onDoubleTap: _handleDoubleTap,
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      child: CachedNetworkImage(
                        imageUrl: e,
                        errorWidget: (context, url, error) => Image.asset(
                          AssetPath.logoWithTitle,
                          fit: BoxFit.fitWidth,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                    .toList();
              default:
                return null;
            }
          }(),
          options: CarouselOptions(
            pauseAutoPlayInFiniteScroll: false,
            enableInfiniteScroll: false,
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            initialPage: widget.initialPage,
          ),
        ),
      ),
    );
  }
}
