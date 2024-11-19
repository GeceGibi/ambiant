part of 'pods.dart';

const _pLight = Duration(milliseconds: 40);
const police = Chain(
  name: 'Police',
  chain: [
    ChainRing(_pLight, Color(0xffff0000)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xffff0000)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xffff0000)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xffff0000)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xffff0000)),
    ChainRing(Duration(milliseconds: 250), Colors.black),
    ChainRing(_pLight, Color(0xff0000ff)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xff0000ff)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xff0000ff)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xff0000ff)),
    ChainRing(_pLight, Colors.black),
    ChainRing(_pLight, Color(0xff0000ff)),
  ],
);

const rainbow = Chain(
  name: 'Rainbow',
  faded: true,
  chain: [
    ChainRing(Duration(seconds: 2), Color(0xffFF1419)),
    ChainRing(Duration(seconds: 2), Color(0xffFDA216)),
    ChainRing(Duration(seconds: 2), Color(0xffFDFA15)),
    ChainRing(Duration(seconds: 2), Color(0xff76D442)),
    ChainRing(Duration(seconds: 2), Color(0xff00ADF2)),
    ChainRing(Duration(seconds: 2), Color(0xff0973BD)),
    ChainRing(Duration(seconds: 2), Color(0xff67318F)),
  ],
);

const _chains = <Chain>[
  police,
  rainbow,
];

final chainsPod = StateNotifierProvider<TemplatesPodState, List<Chain>>(
  (ref) => TemplatesPodState(),
);

class TemplatesPodState extends StateNotifier<List<Chain>> {
  TemplatesPodState() : super(_chains);

  void add(Chain chain) {
    state = [...state, chain];
  }

  void remove() {}
}

final chainPod = StateProvider((ref) {
  return rainbow;
});
