import 'package:flutter/material.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';
import 'package:zeeve/features/workspace/view/workspace_page.dart';
import 'package:zeeve/models/drawer_page.dart';

const kSwitchDuration = Duration(milliseconds: 150);
const kPageDuration = Duration(milliseconds: 250);
const kPageCurve = Curves.easeInOutCubic;

List<DrawerPage> kPages = [
  DrawerPage(
    title: 'Dashboard',
    icon: const Icon(Icons.dashboard),
    page: const MarketplacePage(),
  ),
  DrawerPage(
    title: 'Workspace',
    icon: const Icon(Icons.group_work),
    page: const WorkspacePage(),
  ),
  DrawerPage(
    title: 'Marketplace',
    icon: const Icon(Icons.shopping_basket),
    page: const MarketplacePage(),
  ),
];
