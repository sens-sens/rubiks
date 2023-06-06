import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rubiks/providers/product_provider.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return           Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        ref.read(filterProvider.notifier).state = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}