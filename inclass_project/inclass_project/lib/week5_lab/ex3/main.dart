import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    imageUrl:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAA8FBMVEX///8AdckAxLMi08UAqOFNmdEAb8gAc8kAyLIAb8oAhMUAuLcAo9/G5vYmzbYA0MEAaMUAv6wAp+EAasbV9PH4/f3I8e0NiNENjNMNmtrq+vjh+PXw+vkNgc4FrOMNktZs1Mlf0sUAlcFtwukKecoNndvu9PqzzOl7x+tbl9XA1e3R4PJ+q9yJsd8Rybm77umf6OGe4dlNzsGp5d2/6+aK3NN62M4NksUAf8QAicQAnL8Ao70Arrp9pt0/pse13vUAYcaQz+7c7/lPuOaWuuJEjNFnnteLze3c5/UArLqUuOEApbpzxtRO2c2l1/FntNtuCBYmAAAJG0lEQVR4nO3deXvTRhAHYGEbKyYujp2jxQnBgRwEiDkDpUA5Eo6mhX7/b1P51jGzO7s7M2vzdP5OIr3P/CxptIqVJOrVfzp49mzwdEd/y0p10K2Nq9sd7MbeF4naquWqe7AXe3/Y62W3Vqju89h7xFs7tUp1D2LvFGcNulVhrTaMvVtsBTRwStyOvWs8BTfw5yG+QHk/B3H7AG/gT0E0N3D1idYGrjqR0MBJrSiR1sAVJj6m+1aSuPfMCVirrdp1+HNH36oRnRu4akSPBq4U0a+BK0T0beCqEAMauBrEoAauALEf2MBx9WMrDPWUwbfMxP6QB7i0RKYGLi1xl62BS0rkbOAyEpkbuHzEc37fUhElGjiq7rIQZRo4qvPYtHFtCTVwXLFxo5JrYFbdrdi84nqnQEWPaXm9k7/i+qQbWIsdU/kGZvUynk+hgeOKBlRpYFbdSE/doAvW/BUnpoYFa/6K4FNsYC1KTFUbmNVA2fdiTbeyJuoC+69+v6FSr1+9unv3jzdv19fWXqgK361fb6V61Wy20td/vj/WAz78sH7zevOaaqWtW+39j5+UhIet9Zo+8df9Xq+9/0NjDfxRMxNGIDay6rXb98Qb+W3j2kioTkxvNRoT5IWw8TCdCNWJt/cbKsazjDURahPTxrx6R/fFPo9ZRudCZeIsptM+vhcSZhldCJWJ85iOq30h0saz1rW8UJfY7OWFjV7vF37gOKN5oSoxvbNfJB59ZBfeTstCVWIxpqOk3mMGXk0xeaEmsdlulIkXrMBpRktCRWL6W7mJzMRpRstCReJhRchKvJw7SkI9YnpUETISjzfmGyoL1YhATBmJ84wCQr0uAkKuI+pla7GZqlCLCMWUiZjLKChUImZzsBTxc5rbDiTUIkJADmI+o4hQh1gYMBiJhYxiQh0iHNNgYiGjqFCFiMQ0kHi5WdwKJtQgYjENIpYyahBqECsDBgOxlFGTUIGY9jChN/Fks7wRg1CeWJ6Dw4nHFaBRKE/EY+pJrGTUIhQnppU5OIxYzahNKE00xdSDCGTUKpQmAnNwnnjfTQhk1C4UJhpj6kqEMkoQyhLBOdiTuN0CN2EXCnfRLHQhnkIZJQlFifAc7EOEM0oTShKROdidiGSUKBTtok1IJCIZpQoFifiA4UR8gGSULBQkWmNKIW7je0cVyhHROdiFeMogFCMSYpoRv5ozWh57vYRiRNOAQSSadsxBKEU0zMFE4hcuoRAxvUMRGoimjDoKhYikmBqI2JnQRyhDpMUUJRoz6iwUIZrn4DwRepzhoTGj7kIRonkOztUR8FCKOaMeQgmiZQ7ONbEqfGfbG3ehANE2BxuEtox6CSW66C20/2kfIT/ROgdjwkf2HfESshOpMS0L7Rn1FfIT/YSUP+0p5CaSBoyKkJBRfyE3kTAHV4SUjAYImYmUObgsPLSd7AOFvERaTAvCM9rmA4S8RNocnBN+I2U0TMhKJMU0L6RlNFDISSTNwTkhMaOhQk4iJaYLITWjwUJGYpMwBy+E1IyGC/mIlDl4LrzCVikEhHxEwhw8E9LO9VxCNiJhDp4JXf4sg5CLSBgwpkJ8GUZIyNZFqpB0xc0qZCLa5+CpEF0rlBPyEO0xnQrBp0qEhUxdJApj9JCHaH9sYfo5jCLkIFofW5gKT/SPNGxEWg8rzwErCRmItjl4dsa/7RBTTiED0TJgzIQn9MtSXmE40RLT+ZV3rB6GEy1z8FyIPeIlLwwmmmO6mA/pJ31uYSjRvB68EIKPA+sIA4mW56IX92nMjyeICgOJxjk4f6/tUuNuogTR/Ph+/o7wFS2oEsIgonHAKN7VPyMRRYRBRFNMS2tPJKKMMIRoGjDK64cUopAwgGiKaWWVm0CUEoZ00UFIIIoJ/YmGmALP0zyyEeWE3kTDHAwIrURBoT/RpYdWoqTQl2j4/2Dwy5bMRFGhLxEdMGChmSgr9CTi/8aOfGGWiSgs9COiMcWEJqK00I+IxRQVJu/QOzfiQi8ith6MC5MvYf/ZpU3E5mCDECUqCH2IyIBhEmJEDaEHEZmDjUKEqCJ0JyIxNQthoo7QnQjH1CIE//WiqSN0JiLfk2X7ikyAqCV0JcJzsFUIEJtv15aTCH+dm/1rTk/Ln8XmX1pCRyIYU4KwQmz+rSZ0I4JzMEVYJmoKHYmePcyIG/nNNN8oCp2I0IBBEyafrg435xtK72oKnYhATInCrL6dpZuTBbj0hqrQhQjElC7M6uGXzdYImeoKHYhATJ2EWT043WilSpdtPsTqHOwqTJLtk88fNA+mjkQGYVbH/2gLqUTo66K9vrp9t1MfLiURWNL3Eyb1UekiKUToosZTeN6pqyMJRGjM9xRuTYX1ekcPaSdCdxQ9hUk9V2pIGxG8K+wrfNKpR0BaiOBtDF/hXlGo9ZE0EuFbUb7CZFAW6iBNRHhxxlu4VWmiDhInIo8reAuT76BQHokSkQf4/IU7cBPljzsYEVnK9xfiTZRGwkTs4bYAoaGJwmkFie7rh4FNFEUCRPc1YELtWpooiKwS0Yf3QoTz6+8IyDIRf044SJjYdZMSOO6UiNijGL029D1R9EJO+yrIAhE+249eefk+8AV0xJxO08qLzBOBs/2Ix/HuOfvxtIgUIpbO9r1eu3ef6dV6225CXuScWFh0yniNr4xvDuy75JQbOSMuzvZjHvNrSn2IbMedCXHxnlmZ1yJ7EbmQE+L+lPdD6CWznkSeg2tGzM72Ge/ih+Cbu72JHB/Jm9c3e+2L0NOeIDEcefNfaV4wMQw5HO7I+8KJ3shhdshSATIQfZDD0a8NlIQcRMeD69hX7zzWErIQ6Y0czn6ho3CY4SWSkMPFT3/XAybJHo/Qisz56p3nmsKkz0Y0IIeFH+v0VYWMXazDV67D8g+phpSdWEFWfPXOE20hNzGf1qovE+6qC/mJUyRyoNYHihDR6pzHEGoSO1tRhIpEravuaMTOy1hCLWJHZzSMSIwWUjXiIKbQ4264cymOhpGImqNhHKL6Vbc2UXk0jEDs7MX2JcLE+CEdlSAxwmgIlhwxxmgIlhwxtmxeQsRIoyFYMsRYoyFYMsTYqkJt1zvsFW80hKufq120tsDaAUv5TvD/Fb3+A19lmUjYUXHMAAAAAElFTkSuQmCC',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/1024px-Flutter_logo.svg.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best backend service',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLcbEasKdJtrhXuK7HD2kuDLEnQyonwugtyg&s',
  );

  final String title;
  final String description;
  final String imageUrl;

  const Product({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.blue),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  ProductCard(product: Product.dart),
                  SizedBox(height: 16.0),
                  ProductCard(product: Product.flutter),
                  SizedBox(height: 16.0),
                  ProductCard(product: Product.firebase),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.imageUrl, height: 100.0),
          const SizedBox(height: 8.0),
          Text(
            product.title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(
            product.description,
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
