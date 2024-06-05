
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_colors.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class ImgUrlWidget extends StatefulWidget {

  /// ССылка
  final String url;

  /// Заменитель
  final String? placeholder;

  /// Размер
  final double? size;

  /// Высота
  final double? height;

  /// Ширина
  final double? width;

  /// Увеличение [placeholder]
  final double? scalePlaceholder;

  /// Радиус
  final double? borderRadius;

  ///boxFit
  final BoxFit? boxFit;

  /// Цвет background изображения
  final Color? backgroundColorImage;

  /// Виджет реализует загрузку и вывод изображения по [url]
  const ImgUrlWidget({
    super.key,
    required this.url,
    this.placeholder,
    this.size,
    this.scalePlaceholder,
    this.borderRadius,
    this.boxFit,
    this.height,
    this.width,
    this.backgroundColorImage,
  });

  @override
  State<ImgUrlWidget> createState() => _ImgUrlWidgetState();
}

class _ImgUrlWidgetState extends State<ImgUrlWidget> {
  late AssetImage placeholder;
  Image? memoryImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.placeholder != null && widget.placeholder!.isNotEmpty) {
      placeholder = AssetImage(widget.placeholder!);
      precacheImage(placeholder, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty) return _placeholderWidget();

    return Container(
      height: (widget.height ?? widget.size),
      width: (widget.width ?? widget.size),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? AppBorderRadius.radius10),
        color: widget.backgroundColorImage ??
            context.theme.adaptiveColor(
              AppColorsLight.white,
              AppColorsDark.grey1,
            ),
      ),
      clipBehavior: Clip.hardEdge,
      child: _child(),
    );
  }

  /// Дочерний виджет
  Widget _child() {
    try {
      return CachedNetworkImage(
        fit: widget.boxFit ?? BoxFit.fill,
        imageUrl: widget.url,
        placeholder: (context, url) => _placeholderWidget(),
        errorWidget: (context, url, error) => _placeholderWidget(),
      );
    } catch (_) {
      return _placeholderWidget();
    }
  }

  /// Заменитель при ошибке загрузки
  Widget _placeholderWidget() {
    return Container(
      height: widget.height ?? widget.size,
      width: widget.width ?? widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColorImage,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 90),
        image: widget.placeholder != null && widget.placeholder!.isNotEmpty
            ? DecorationImage(
                scale: widget.scalePlaceholder ?? 1.0,
                image: placeholder,
              )
            : null,
      ),
    );
  }
}
