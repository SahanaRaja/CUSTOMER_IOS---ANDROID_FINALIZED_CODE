

class CurrencyCode {
  int? timestamp;
  String? base;
  Rates? rates;



  CurrencyCode({this.timestamp, this.base, this.rates});

  CurrencyCode.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    base = json['base'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['timestamp'] = timestamp;
    data['base'] = base;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    return data;
  }
}

class Rates {
  dynamic dZD;
  dynamic nAD;
  dynamic gHS;
  dynamic eGP;
  dynamic bGN;
  dynamic xCD;
  dynamic pAB;
  dynamic bOB;
  dynamic dKK;
  dynamic bWP;
  dynamic lBP;
  dynamic tZS;
  dynamic vND;
  dynamic aOA;
  dynamic kHR;
  dynamic mYR;
  dynamic kYD;
  dynamic lYD;
  dynamic uAH;
  dynamic jOD;
  dynamic aWG;
  dynamic sAR;
  dynamic xAG;
  dynamic hKD;
  dynamic cHF;
  dynamic gIP;
  dynamic mRU;
  dynamic aLL;
  dynamic xPD;
  dynamic bYN;
  dynamic hRK;
  dynamic dJF;
  dynamic sZL;
  dynamic tHB;
  dynamic xAF;
  dynamic bND;
  dynamic iSK;
  dynamic uYU;
  dynamic nIO;
  dynamic lAK;
  dynamic sYP;
  dynamic mAD;
  dynamic mZN;
  dynamic pHP;
  dynamic zAR;
  dynamic nPR;
  dynamic zWL;
  dynamic nGN;
  dynamic cRC;
  dynamic aED;
  dynamic gBP;
  dynamic mWK;
  dynamic lKR;
  dynamic pKR;
  dynamic hUF;
  dynamic bMD;
  dynamic lSL;
  dynamic mNT;
  dynamic aMD;
  dynamic uGX;
  dynamic qAR;
  dynamic xDR;
  dynamic sTN;
  dynamic jMD;
  dynamic gEL;
  dynamic sHP;
  dynamic aFN;
  dynamic sBD;
  dynamic kPW;
  dynamic tRY;
  dynamic bDT;
  dynamic yER;
  dynamic hTG;
  dynamic xOF;
  dynamic mGA;
  dynamic aNG;
  dynamic lRD;
  dynamic rWF;
  dynamic nOK;
  dynamic mOP;
  dynamic sSP;
  dynamic iNR;
  dynamic mXN;
  dynamic cZK;
  dynamic tJS;
  dynamic bTC;
  dynamic bTN;
  dynamic cOP;
  dynamic tMT;
  dynamic mUR;
  dynamic iDR;
  dynamic hNL;
  dynamic xPF;
  dynamic fJD;
  dynamic eTB;
  dynamic pEN;
  dynamic bZD;
  dynamic iLS;
  dynamic dOP;
  dynamic gGP;
  dynamic mDL;
  dynamic xPT;
  dynamic bSD;
  dynamic sEK;
  dynamic jEP;
  dynamic aUD;
  dynamic sRD;
  dynamic cUP;
  dynamic cLF;
  dynamic bBD;
  dynamic kMF;
  dynamic kRW;
  dynamic gMD;
  dynamic iMP;
  dynamic cUC;
  dynamic cLP;
  dynamic zMW;
  dynamic eUR;
  dynamic cDF;
  dynamic vES;
  dynamic kZT;
  dynamic rUB;
  dynamic tTD;
  dynamic oMR;
  dynamic bRL;
  dynamic mMK;
  dynamic pLN;
  dynamic pYG;
  dynamic kES;
  dynamic sVC;
  dynamic mKD;
  dynamic aZN;
  dynamic tOP;
  dynamic mVR;
  dynamic vUV;
  dynamic gNF;
  dynamic wST;
  dynamic iQD;
  dynamic eRN;
  dynamic bAM;
  dynamic sCR;
  dynamic cAD;
  dynamic cVE;
  dynamic kWD;
  dynamic bIF;
  dynamic pGK;
  dynamic sOS;
  dynamic tWD;
  dynamic sGD;
  dynamic uZS;
  dynamic sTD;
  dynamic iRR;
  dynamic cNY;
  dynamic sLL;
  dynamic tND;
  dynamic gYD;
  dynamic nZD;
  dynamic fKP;
  dynamic uSD;
  dynamic cNH;
  dynamic kGS;
  dynamic aRS;
  dynamic rON;
  dynamic gTQ;
  dynamic rSD;
  dynamic bHD;
  dynamic jPY;
  dynamic sDG;
  dynamic xAU;

  Rates(
      {this.dZD,
      this.nAD,
      this.gHS,
      this.eGP,
      this.bGN,
      this.xCD,
      this.pAB,
      this.bOB,
      this.dKK,
      this.bWP,
      this.lBP,
      this.tZS,
      this.vND,
      this.aOA,
      this.kHR,
      this.mYR,
      this.kYD,
      this.lYD,
      this.uAH,
      this.jOD,
      this.aWG,
      this.sAR,
      this.xAG,
      this.hKD,
      this.cHF,
      this.gIP,
      this.mRU,
      this.aLL,
      this.xPD,
      this.bYN,
      this.hRK,
      this.dJF,
      this.sZL,
      this.tHB,
      this.xAF,
      this.bND,
      this.iSK,
      this.uYU,
      this.nIO,
      this.lAK,
      this.sYP,
      this.mAD,
      this.mZN,
      this.pHP,
      this.zAR,
      this.nPR,
      this.zWL,
      this.nGN,
      this.cRC,
      this.aED,
      this.gBP,
      this.mWK,
      this.lKR,
      this.pKR,
      this.hUF,
      this.bMD,
      this.lSL,
      this.mNT,
      this.aMD,
      this.uGX,
      this.qAR,
      this.xDR,
      this.sTN,
      this.jMD,
      this.gEL,
      this.sHP,
      this.aFN,
      this.sBD,
      this.kPW,
      this.tRY,
      this.bDT,
      this.yER,
      this.hTG,
      this.xOF,
      this.mGA,
      this.aNG,
      this.lRD,
      this.rWF,
      this.nOK,
      this.mOP,
      this.sSP,
      this.iNR,
      this.mXN,
      this.cZK,
      this.tJS,
      this.bTC,
      this.bTN,
      this.cOP,
      this.tMT,
      this.mUR,
      this.iDR,
      this.hNL,
      this.xPF,
      this.fJD,
      this.eTB,
      this.pEN,
      this.bZD,
      this.iLS,
      this.dOP,
      this.gGP,
      this.mDL,
      this.xPT,
      this.bSD,
      this.sEK,
      this.jEP,
      this.aUD,
      this.sRD,
      this.cUP,
      this.cLF,
      this.bBD,
      this.kMF,
      this.kRW,
      this.gMD,
      this.iMP,
      this.cUC,
      this.cLP,
      this.zMW,
      this.eUR,
      this.cDF,
      this.vES,
      this.kZT,
      this.rUB,
      this.tTD,
      this.oMR,
      this.bRL,
      this.mMK,
      this.pLN,
      this.pYG,
      this.kES,
      this.sVC,
      this.mKD,
      this.aZN,
      this.tOP,
      this.mVR,
      this.vUV,
      this.gNF,
      this.wST,
      this.iQD,
      this.eRN,
      this.bAM,
      this.sCR,
      this.cAD,
      this.cVE,
      this.kWD,
      this.bIF,
      this.pGK,
      this.sOS,
      this.tWD,
      this.sGD,
      this.uZS,
      this.sTD,
      this.iRR,
      this.cNY,
      this.sLL,
      this.tND,
      this.gYD,
      this.nZD,
      this.fKP,
      this.uSD,
      this.cNH,
      this.kGS,
      this.aRS,
      this.rON,
      this.gTQ,
      this.rSD,
      this.bHD,
      this.jPY,
      this.sDG,
      this.xAU});

  Rates.fromJson(Map<String, dynamic> json) {
    dZD = json['DZD'];
    nAD = json['NAD'];
    gHS = json['GHS'];
    eGP = json['EGP'];
    bGN = json['BGN'];
    xCD = json['XCD'];
    pAB = json['PAB'];
    bOB = json['BOB'];
    dKK = json['DKK'];
    bWP = json['BWP'];
    lBP = json['LBP'];
    tZS = json['TZS'];
    vND = json['VND'];
    aOA = json['AOA'];
    kHR = json['KHR'];
    mYR = json['MYR'];
    kYD = json['KYD'];
    lYD = json['LYD'];
    uAH = json['UAH'];
    jOD = json['JOD'];
    aWG = json['AWG'];
    sAR = json['SAR'];
    xAG = json['XAG'];
    hKD = json['HKD'];
    cHF = json['CHF'];
    gIP = json['GIP'];
    mRU = json['MRU'];
    aLL = json['ALL'];
    xPD = json['XPD'];
    bYN = json['BYN'];
    hRK = json['HRK'];
    dJF = json['DJF'];
    sZL = json['SZL'];
    tHB = json['THB'];
    xAF = json['XAF'];
    bND = json['BND'];
    iSK = json['ISK'];
    uYU = json['UYU'];
    nIO = json['NIO'];
    lAK = json['LAK'];
    sYP = json['SYP'];
    mAD = json['MAD'];
    mZN = json['MZN'];
    pHP = json['PHP'];
    zAR = json['ZAR'];
    nPR = json['NPR'];
    zWL = json['ZWL'];
    nGN = json['NGN'];
    cRC = json['CRC'];
    aED = json['AED'];
    gBP = json['GBP'];
    mWK = json['MWK'];
    lKR = json['LKR'];
    pKR = json['PKR'];
    hUF = json['HUF'];
    bMD = json['BMD'];
    lSL = json['LSL'];
    mNT = json['MNT'];
    aMD = json['AMD'];
    uGX = json['UGX'];
    qAR = json['QAR'];
    xDR = json['XDR'];
    sTN = json['STN'];
    jMD = json['JMD'];
    gEL = json['GEL'];
    sHP = json['SHP'];
    aFN = json['AFN'];
    sBD = json['SBD'];
    kPW = json['KPW'];
    tRY = json['TRY'];
    bDT = json['BDT'];
    yER = json['YER'];
    hTG = json['HTG'];
    xOF = json['XOF'];
    mGA = json['MGA'];
    aNG = json['ANG'];
    lRD = json['LRD'];
    rWF = json['RWF'];
    nOK = json['NOK'];
    mOP = json['MOP'];
    sSP = json['SSP'];
    iNR = json['INR'];
    mXN = json['MXN'];
    cZK = json['CZK'];
    tJS = json['TJS'];
    bTC = json['BTC'];
    bTN = json['BTN'];
    cOP = json['COP'];
    tMT = json['TMT'];
    mUR = json['MUR'];
    iDR = json['IDR'];
    hNL = json['HNL'];
    xPF = json['XPF'];
    fJD = json['FJD'];
    eTB = json['ETB'];
    pEN = json['PEN'];
    bZD = json['BZD'];
    iLS = json['ILS'];
    dOP = json['DOP'];
    gGP = json['GGP'];
    mDL = json['MDL'];
    xPT = json['XPT'];
    bSD = json['BSD'];
    sEK = json['SEK'];
    jEP = json['JEP'];
    aUD = json['AUD'];
    sRD = json['SRD'];
    cUP = json['CUP'];
    cLF = json['CLF'];
    bBD = json['BBD'];
    kMF = json['KMF'];
    kRW = json['KRW'];
    gMD = json['GMD'];
    iMP = json['IMP'];
    cUC = json['CUC'];
    cLP = json['CLP'];
    zMW = json['ZMW'];
    eUR = json['EUR'];
    cDF = json['CDF'];
    vES = json['VES'];
    kZT = json['KZT'];
    rUB = json['RUB'];
    tTD = json['TTD'];
    oMR = json['OMR'];
    bRL = json['BRL'];
    mMK = json['MMK'];
    pLN = json['PLN'];
    pYG = json['PYG'];
    kES = json['KES'];
    sVC = json['SVC'];
    mKD = json['MKD'];
    aZN = json['AZN'];
    tOP = json['TOP'];
    mVR = json['MVR'];
    vUV = json['VUV'];
    gNF = json['GNF'];
    wST = json['WST'];
    iQD = json['IQD'];
    eRN = json['ERN'];
    bAM = json['BAM'];
    sCR = json['SCR'];
    cAD = json['CAD'];
    cVE = json['CVE'];
    kWD = json['KWD'];
    bIF = json['BIF'];
    pGK = json['PGK'];
    sOS = json['SOS'];
    tWD = json['TWD'];
    sGD = json['SGD'];
    uZS = json['UZS'];
    sTD = json['STD'];
    iRR = json['IRR'];
    cNY = json['CNY'];
    sLL = json['SLL'];
    tND = json['TND'];
    gYD = json['GYD'];
    nZD = json['NZD'];
    fKP = json['FKP'];
    uSD = json['USD'];
    cNH = json['CNH'];
    kGS = json['KGS'];
    aRS = json['ARS'];
    rON = json['RON'];
    gTQ = json['GTQ'];
    rSD = json['RSD'];
    bHD = json['BHD'];
    jPY = json['JPY'];
    sDG = json['SDG'];
    xAU = json['XAU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['DZD'] = dZD;
    data['NAD'] = nAD;
    data['GHS'] = gHS;
    data['EGP'] = eGP;
    data['BGN'] = bGN;
    data['XCD'] = xCD;
    data['PAB'] = pAB;
    data['BOB'] = bOB;
    data['DKK'] = dKK;
    data['BWP'] = bWP;
    data['LBP'] = lBP;
    data['TZS'] = tZS;
    data['VND'] = vND;
    data['AOA'] = aOA;
    data['KHR'] = kHR;
    data['MYR'] = mYR;
    data['KYD'] = kYD;
    data['LYD'] = lYD;
    data['UAH'] = uAH;
    data['JOD'] = jOD;
    data['AWG'] = aWG;
    data['SAR'] = sAR;
    data['XAG'] = xAG;
    data['HKD'] = hKD;
    data['CHF'] = cHF;
    data['GIP'] = gIP;
    data['MRU'] = mRU;
    data['ALL'] = aLL;
    data['XPD'] = xPD;
    data['BYN'] = bYN;
    data['HRK'] = hRK;
    data['DJF'] = dJF;
    data['SZL'] = sZL;
    data['THB'] = tHB;
    data['XAF'] = xAF;
    data['BND'] = bND;
    data['ISK'] = iSK;
    data['UYU'] = uYU;
    data['NIO'] = nIO;
    data['LAK'] = lAK;
    data['SYP'] = sYP;
    data['MAD'] = mAD;
    data['MZN'] = mZN;
    data['PHP'] = pHP;
    data['ZAR'] = zAR;
    data['NPR'] = nPR;
    data['ZWL'] = zWL;
    data['NGN'] = nGN;
    data['CRC'] = cRC;
    data['AED'] = aED;
    data['GBP'] = gBP;
    data['MWK'] = mWK;
    data['LKR'] = lKR;
    data['PKR'] = pKR;
    data['HUF'] = hUF;
    data['BMD'] = bMD;
    data['LSL'] = lSL;
    data['MNT'] = mNT;
    data['AMD'] = aMD;
    data['UGX'] = uGX;
    data['QAR'] = qAR;
    data['XDR'] = xDR;
    data['STN'] = sTN;
    data['JMD'] = jMD;
    data['GEL'] = gEL;
    data['SHP'] = sHP;
    data['AFN'] = aFN;
    data['SBD'] = sBD;
    data['KPW'] = kPW;
    data['TRY'] = tRY;
    data['BDT'] = bDT;
    data['YER'] = yER;
    data['HTG'] = hTG;
    data['XOF'] = xOF;
    data['MGA'] = mGA;
    data['ANG'] = aNG;
    data['LRD'] = lRD;
    data['RWF'] = rWF;
    data['NOK'] = nOK;
    data['MOP'] = mOP;
    data['SSP'] = sSP;
    data['INR'] = iNR;
    data['MXN'] = mXN;
    data['CZK'] = cZK;
    data['TJS'] = tJS;
    data['BTC'] = bTC;
    data['BTN'] = bTN;
    data['COP'] = cOP;
    data['TMT'] = tMT;
    data['MUR'] = mUR;
    data['IDR'] = iDR;
    data['HNL'] = hNL;
    data['XPF'] = xPF;
    data['FJD'] = fJD;
    data['ETB'] = eTB;
    data['PEN'] = pEN;
    data['BZD'] = bZD;
    data['ILS'] = iLS;
    data['DOP'] = dOP;
    data['GGP'] = gGP;
    data['MDL'] = mDL;
    data['XPT'] = xPT;
    data['BSD'] = bSD;
    data['SEK'] = sEK;
    data['JEP'] = jEP;
    data['AUD'] = aUD;
    data['SRD'] = sRD;
    data['CUP'] = cUP;
    data['CLF'] = cLF;
    data['BBD'] = bBD;
    data['KMF'] = kMF;
    data['KRW'] = kRW;
    data['GMD'] = gMD;
    data['IMP'] = iMP;
    data['CUC'] = cUC;
    data['CLP'] = cLP;
    data['ZMW'] = zMW;
    data['EUR'] = eUR;
    data['CDF'] = cDF;
    data['VES'] = vES;
    data['KZT'] = kZT;
    data['RUB'] = rUB;
    data['TTD'] = tTD;
    data['OMR'] = oMR;
    data['BRL'] = bRL;
    data['MMK'] = mMK;
    data['PLN'] = pLN;
    data['PYG'] = pYG;
    data['KES'] = kES;
    data['SVC'] = sVC;
    data['MKD'] = mKD;
    data['AZN'] = aZN;
    data['TOP'] = tOP;
    data['MVR'] = mVR;
    data['VUV'] = vUV;
    data['GNF'] = gNF;
    data['WST'] = wST;
    data['IQD'] = iQD;
    data['ERN'] = eRN;
    data['BAM'] = bAM;
    data['SCR'] = sCR;
    data['CAD'] = cAD;
    data['CVE'] = cVE;
    data['KWD'] = kWD;
    data['BIF'] = bIF;
    data['PGK'] = pGK;
    data['SOS'] = sOS;
    data['TWD'] = tWD;
    data['SGD'] = sGD;
    data['UZS'] = uZS;
    data['STD'] = sTD;
    data['IRR'] = iRR;
    data['CNY'] = cNY;
    data['SLL'] = sLL;
    data['TND'] = tND;
    data['GYD'] = gYD;
    data['NZD'] = nZD;
    data['FKP'] = fKP;
    data['USD'] = uSD;
    data['CNH'] = cNH;
    data['KGS'] = kGS;
    data['ARS'] = aRS;
    data['RON'] = rON;
    data['GTQ'] = gTQ;
    data['RSD'] = rSD;
    data['BHD'] = bHD;
    data['JPY'] = jPY;
    data['SDG'] = sDG;
    data['XAU'] = xAU;
    return data;
  }
}


