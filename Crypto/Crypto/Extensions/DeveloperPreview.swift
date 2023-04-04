//
//  DeveloperPreview.swift
//  Crypto
//
//  Created by TheGIZzz on 19/3/2566 BE.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let cardVM = CardViewModel()
    
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 16089.7,
        marketCap: 309281919184,
        marketCapRank: 1,
        fullyDilutedValuation: 338026114717,
        totalVolume: 29460234699,
        high24H: 16234.57,
        low24H: 15649.4,
        priceChange24H: -144.8682895359434,
        priceChangePercentage24H: -0.89234,
        marketCapChange24H: -2224471257.1053467,
        marketCapChangePercentage24H: -0.7141,
        circulatingSupply: 19214256.0,
        totalSupply: 21000000.0,
        maxSupply: 21000000.0,
        ath: 69045,
        athChangePercentage: -76.66331,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 23661.9843,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-11-22T14:53:14.132Z",
        sparklineIn7D: SparklineIn7D(price: [
        16806.84579045593,16895.02524166953,16958.615596238244,16883.101189397585,17044.682788091155,16999.185934513513,17012.123731873995,16707.257677987018,16820.58496349045,16820.062114949425,16912.747269948228,16898.266308137103,16890.52938386464,16816.567630161077,16864.861378096983,16971.477570910884,16962.710953225433,16906.534604557302,16941.666173327234,16852.479576357695,16878.44657453432,16774.882448604076,16741.035260606328,16731.065310389302,16713.46263663692,16647.439245679256,16588.221163820028,16475.449843515013,16528.640187034187,16534.106193668733,16578.250112917038,16563.51753152722,16565.85251404394,16599.5167018772,16562.50892038153,16571.94743116972,16689.39673273771,16710.785256065774,16712.606588416704,16663.306454521073,16569.611384863838,16522.14372563892,16579.687638660467,16583.954839506318,16606.589895674788,16605.145806109893,16537.21336091995,16549.389684701124,16588.771126081658,16571.051559256317,16473.582867086327,16523.81480321521,16576.32413292483,16653.340147597617,16642.36133870722,16706.135549754577,16660.87367101332,16685.07782434675,16702.921065553997,16717.80065833992,16718.361228055077,16872.711269156855,16876.508826514393,16945.238957407422,16863.89972224021,16818.96041503547,16811.640755079494,16800.757153907303,16742.097263210784,16732.415628379225,16748.175436876507,16822.048915729945,16758.304762996395,16778.388346018986,16770.200488633123,16698.63315315737,16702.445985125098,16635.991189053635,16605.666730543526,16596.31834360901,16612.110649158658,16643.89438080358,16678.76995406288,16671.949239570313,16707.022778986535,16684.726827920436,16667.73760846752,16633.615046413594,16645.734701181802,16638.38369158229,16612.085485128762,16621.5952914838,16615.62077947474,16658.780182535495,16651.452619338255,16654.12978043233,16663.0956354486,16666.902598152796,16667.479443612407,16660.26673951922,16668.11687710028,16668.05293875713,16621.531733791282,16631.06595412144,16638.93990096001,16652.63709948569,16694.659636993292,16749.81904501506,16711.873000389467,16731.547646284893,16734.223063376623,16703.06278430098,16698.099106944115,16700.36970791143,16695.34306727752,16701.714438816867,16726.174143970165,16620.464779243754,16652.176172793235,16624.699224336186,16571.59968260733,16563.656183392606,16578.52534114607,16566.279967373655,16600.24153665448,16599.573939504007,16561.594183007754,16588.88217544183,16572.673227419204,16527.127957427558,16404.243066530144,16308.812646583983,16304.07685562355,16233.508931320219,16229.013161337716,16031.186769376665,16064.001089561465,16163.314134819153,16185.298325953685,16111.728070055875,16084.063614648307,16031.918545533374,16067.04558328075,16130.595601614366,16089.63697072075,16073.783909170232,16214.037839455497,16234.570924644582,16163.378702587872,16052.862440419338,16056.555207803576,16000.304804972124,15665.728828858591,15835.072486141444,15734.494872016803,15759.21495702581,15794.327604914475,15885.888268145578,15823.642467902782,15813.484951266764,15880.295908474383,15835.25424768187,15840.759180850695,15758.848740937732,15748.64141743841,15728.290575641106,15700.60132213548,15817.852304267795
        ]),
        priceChangePercentage24HInCurrency: -0.8923444309576969,
        currentHoldings: 1)
}
