import 'package:equatable/equatable.dart';

class LanguageResponse extends Equatable {
  final String? clientRegistration;
  final String? clientAssist;
  final String? error;
  final String? mobileNumber;
  final String? resendOtp;
  final String? mobileOwnerDetails;
  final String? home;
  final String? office;
  final String? firstName;
  final String? lastName;
  final String? location;
  final String? city;
  final String? ownerDetails;
  final String? user;
  final String? client;
  final String? firstTimeUser;
  final String? password;
  final String? provideMailId;
  final String? confirmMailId;
  final String? otpIncorrectError;
  final String? repeatPassword;
  final String? passwordConstruct;
  final String? ChnagePwdInfo;
  final String? PwdMissMatchError;
  final String? newPwdCreated;
  final String? newPassword;
  final String? resetPwdCreated;
  final String? welcomeClient;
  final String? personalProfile;
  final String? clientPicture;
  final String? province;
  final String? state;
  final String? pinCode;
  final String? dateOfBirth;
  final String? changePassword;
  final String? confirmOwnership;
  final String? oldPassword;
  final String? changePwdCreated;
  final String? changeCountry;
  final String? shoppingSettings;
  final String? lastConfiguration;
  final String? shoppingMode;
  final String? retailVertical;
  final String? deliveryMode;
  final String? deliveryAddress;
  final String? shop;
  final String? deliveryTime;
  final String? shoppingReview;
  final String? selectDeliveryAddress;
  final String? select;
  final String? delete;
  final String? addNewAddress;
  final String? configInfo;
  final String? changeShopMode;
  final String? changeRetailVertical;
  final String? selectRetailVertical;
  final String? changeDeliveryMode;
  final String? changeDeliveryAddress;
  final String? caution;
  final String? deleteAddress;
  final String? yes;
  final String? no;
  final String? addDeliveryAddress;
  final String? selectStore;
  final String? changeStore;
  final String? list;
  final String? terms;
  final String? pictureOfStore;
  final String? name;
  final String? operatingTime;
  final String? catalogue;
  final String? changeDeliveryTime;
  final String? cancelOrder;
  final String? deviceFeedback;
  final String? haptic;
  final String? systemSound;
  final String? hapticPowerConsumptio;
  final String? defaultLanguage;
  final String? newOrder;
  final String? promotions;
  final String? offerFromCpgCompanies;
  final String? gocheckoutAt;
  final String? now;
  final String? notNow;
  final String? shopName;
  final String? selectCategory;
  final String? sku;
  final String? price;
  final String? subCategory1;
  final String? subCategory2;
  final String? selectSubCategory;
  final String? items;
  final String? productName;
  final String? picture;
  final String? ingredients;
  final String? nutrition;
  final String? offers;
  final String? inStock;
  final String? substitute;
  final String? wishList;
  final String? manufacturer;
  final String? brand;
  final String? category;
  final String? buyOneGetOne;
  final String? shopNewOrder;
  final String? reviewCart;
  final String? itemName;
  final String? qty;
  final String? total;
  final String? discounts;
  final String? taxes;
  final String? totalPayable;
  final String? checkout;
  final String? addTips;
  final String? noThanks;
  final String? byValue;
  final String? percentOfPurchase;
  final String? reviewPayment;
  final String? headOfAccount;
  final String? purchaseCost;
  final String? plusTaxes;
  final String? plusDeliveryCharges;
  final String? plusConvenienceFee;
  final String? plusTips;
  final String? lessdiscounts;
  final String? lessCouponsAppiled;
  final String? pay;
  final String? payByCash;
  final String? headofAccount;
  final String? billAmount;
  final String? amountIn;
  final String? cashpaid;
  final String? balanceOutstanding;
  final String? cashToReturn;
  final String? applePay;
  final String? googlePay;
  final String? payPal;
  final String? payByeWallet;
  final String? loyaltyRedemption;
  final String? loyaltyPointsBf;
  final String? pointConversionRate;
  final String? totalMoneyValue;
  final String? thisBillAmount;
  final String? balanceAmountIn;
  final String? convertedBackToPoints;
  final String? pointsEarnedThisBill;
  final String? loyaltyPointsCf;
  final String? payByGiftCard;
  final String? giftCardRefunded;
  final String? selectGiftCard;
  final String? giftCardValue;
  final String? numberOfGiftCards;
  final String? valueOfGiftCards;
  final String? PayByStoreCredit;
  final String? approvedAmount;
  final String? creditPeriodInDays;
  final String? usedOn;
  final String? dueOn;
  final String? bal;
  final String? amountPayableIn;
  final String? payAmountIn;
  final String? creditAvailableIn;
  final String? rePayStoreCredit;
  final String? orderConfirmation;
  final String? thankYouForShopping;
  final String? pleaseVisitAgain;
  final String? oldOrders;
  final String? dateOfOrder;
  final String? amount;
  final String? status;
  final String? outletNameDate;
  final String? totalPaid;
  final String? myShop;
  final String? pending;
  final String? shoppingList;
  final String? quantity;
  final String? pendingOrders;
  final String? totalItems;
  final String? totalCost;
  final String? productBarcodeScan;
  final String? freeFlowShopping;
  final String? shopAtStoreWeigh;
  final String? weight;
  final String? cost;
  final String? shopByList;
  final String? qtyRequired;
  final String? qtyPicked;
  final String? shopAtStore;
  final String? shopAtStorePay;
  final String? addOns;
  final String? review;
  final String? reviewStore;
  final String? store;
  final String? product;
  final String? myComments;
  final String? everyReviewEarnsLoyaltyPoints;
  final String? reviewProduct;
  final String? serviceCharges;
  final String? subscription;
  final String? convenienceFee;
  final String? addFamilyMembers;
  final String? sameAddress;
  final String? different;
  final String? relationship;
  final String? email;
  final String? share;
  final String? yourMobileNumber;
  final String? yourFriendName;
  final String? yourFriendMobileNumber;
  final String? shareMobileNumberToInvite;
  final String? messaging;
  final String? messages;
  final String? messagesSend;
  final String? coupons;
  final String? support;
  final String? expertViews;
  final String? faq;
  final String? resources;
  final String? termsAndConditions;
  final String? configure;
  final String? jewellery;
  final String? selectShop;
  final String? jewelleryShops;
  final String? necklace;
  final String? referenceNumber;
  final String? subCategory;
  final String? arTryOn;
  final String? selectImage;
  final String? takePhoto;
  final String? chooseFromgallery;
  final String? cancel;
  final String? addressSecond;
  final String? addressFirst;
  final String? stateOrProvince;
  final String? postalCode;
  final String? mailId;
  final String? forgotPassword;
  final String? firstTime;
  final String? logOutConformation;
  final String? quitConformation;
  final String? changePasswordInfo;
  final String? resentOtpInfo;
  final String? users;
  final String? installer;
  final String? logout;
  final String? login;
  final String? resetPassword;
  final String? language;
  final String? languageOfOperation;
  final String? credits;
  final String? skip;
  final String? selectLanguage;
  final String? recogniseContry;
  final String? welcome;
  final String? verifyMobileNumber;
  final String? locationPermissionError;
  final String? locationDeniedError;
  final String? mandatoryMailId;
  final String? defauldLanguage;
  final String? otpInfo;
  final String? info;
  final String? locationServicesAreDisable;
  final String? LocationPermissionsAreDenied;
  final String? createPassword;
  final String? success;
  final String? RestartApp;
  final String? profile;
  final String? assetsDownloadFailed;
  final String? profileError;
  final String? loginFailed;
  final String? otpNotSent;
  final String? somethingWentWrong;
  final String? otpNotSentFailed;
  final String? enterMailToProceed;
  final String? skipOnce;
  final String? skipAlways;
  final String? pressAndHold;
  final String? toAddNewAddress;
  final String? disc;
  final String? monthly;
  final String? yearly;
  final String? purchaseValueLimited;
  final String? noIngredientsFound;
  final String? noNutritionFound;
  final String? prodectImage;
  final String? tabThePlaceholder;
  final String? changeDeliveryAddres;
  final String? comments;
  final String? updateYourShopDetails;
  final String? updateYourConfigureDetails;
  final String? changeCountryDetails;
  final String? failed;
  final String? printBill;
  final String? currentShoppingModeFirst;
  final String? currentShoppingModeSecond;
  final String? currentRetailVerticalFirst;
  final String? currentRetailVerticalSecond;
  final String? noOffersFound;
  final String? punctuality;
  final String? service;
  final String? productQuality;
  final String? productVariety;
  final String? easeOfOrdering;
  final String? nutritionalValue;
  final String? variety;
  final String? packaging;
  final String? quality;
  final String? yesSym;
  final String? bill;
  final String? eCommerceMode;
  final String? noPermission;
  final String? defaultText;
  final String? continueText;
  final String? userName;
  final String? greeting;
  final String? profileUpdated;
  final String? doYouReallyWantToDeleteThisItem;
  final String? areYouSureWantToDeleteThisUser;
  final String? searchProduct;
  final String? next;
  final String? failedToFetchCountry;
  final String? verticalUpdatedSuccessfully;
  final String? theLocationServicesAreUsed;
  final String? pause;
  final String? resume;
  final String? neighbourhoodCafe;
  final String? userSettings;
  final String? calculate;
  final String? cameraFacing;
  final String? loading;
  final String? productCategories;
  final String? subCatagoryFilter;
  final String? restaurant;
  final String? restaurantType;
  final String? addressBook;
  final String? currentSettings;
  final String? add_OnsDetails; //key add-OnsDetails
  final String? usersettings;
  final String? reviewDetails;
  final String? payDetails;
  final String? productSuperCategories;
  final String? categories;
  final String? enroll;
  final String? browse;
  final String? browseMethod;
  final String? guestCity;
  final String? selectCity;
  final String? guestCountry;
  final String? selectCountry;
  final String? asGuestUser;
  final String? theCurrentRetailVertical;
  final String? youHaveSelectedCountry;
  final String? restartApp;
  final String? directFeatureAccess;
  final String? resendOTP;
  final String? clientImage;
  final String? ratings;
  final String? subCategoryFilteredby;
  final String? customerRating;
  final String? confirm;
  final String? selectFromWhichCurrency;
  final String? deliverySecurityCode;
  final String? yourOrderNumber;
  final String? orderSuccessfullyPlaced;
  final String? yourOrderWillBeProcessed;
  final String? thankYouForShoppingus;
  final String? scanACode;
  final String? open;
  final String? closes;
  final String? phone;
  final String? distanceToShop;
  final String? max_ProductAvailability; //key max.ProductAvailability
  final String? lowestOverallCost;
  final String? bestQualityAsPerRatings;
  final String? deliverySpeed;
  final String? catalogueOfItems;
  final String? enterDinerData;
  final String? numbeOfGuests;
  final String? numberOfBills;
  final String? productMainCategories;
  final String? productSubCategories;
  final String? promotion;
  final String? selectArea;
  final String? selectShoppingMode;
  final String? youHaveClickedOnADDICONTapOnRegisterNewICON;
  final String? pleaseLoginFirstToAddThisProductToYourWishList;
  final String? payByCard;
  final String? tapOnTheEditIconAfterEnterTheProfileDetails;
  final String? payeeMobileNumber;
  final String? youHaveClickedOnCARTICONTapOnRegisterNewICON;
  final String? Youcanselectacountryofoperation;
  final String? YouhaveselectedIndiaasthecountry;
  @override
  List<Object?> get props => [
        clientRegistration,
        clientAssist,
        error,
        mobileNumber,
        resendOtp,
        mobileOwnerDetails,
        home,
        office,
        firstName,
        lastName,
        location,
        city,
        ownerDetails,
        user,
        client,
        firstTimeUser,
        password,
        provideMailId,
        confirmMailId,
        otpIncorrectError,
        repeatPassword,
        passwordConstruct,
        ChnagePwdInfo,
        PwdMissMatchError,
        newPwdCreated,
        newPassword,
        resetPwdCreated,
        welcomeClient,
        personalProfile,
        clientPicture,
        province,
        state,
        pinCode,
        dateOfBirth,
        changePassword,
        confirmOwnership,
        oldPassword,
        changePwdCreated,
        changeCountry,
        shoppingSettings,
        lastConfiguration,
        shoppingMode,
        retailVertical,
        deliveryMode,
        deliveryAddress,
        shop,
        deliveryTime,
        shoppingReview,
        selectDeliveryAddress,
        select,
        delete,
        addNewAddress,
        configInfo,
        changeShopMode,
        changeRetailVertical,
        selectRetailVertical,
        changeDeliveryMode,
        changeDeliveryAddress,
        caution,
        deleteAddress,
        yes,
        no,
        addDeliveryAddress,
        selectStore,
        changeStore,
        list,
        terms,
        pictureOfStore,
        name,
        operatingTime,
        catalogue,
        changeDeliveryTime,
        cancelOrder,
        deviceFeedback,
        haptic,
        systemSound,
        hapticPowerConsumptio,
        defaultLanguage,
        newOrder,
        promotions,
        offerFromCpgCompanies,
        gocheckoutAt,
        now,
        notNow,
        shopName,
        selectCategory,
        sku,
        price,
        subCategory1,
        subCategory2,
        selectSubCategory,
        items,
        productName,
        picture,
        ingredients,
        nutrition,
        offers,
        inStock,
        substitute,
        wishList,
        manufacturer,
        brand,
        category,
        buyOneGetOne,
        shopNewOrder,
        reviewCart,
        itemName,
        qty,
        total,
        discounts,
        taxes,
        totalPayable,
        checkout,
        addTips,
        noThanks,
        byValue,
        percentOfPurchase,
        reviewPayment,
        headOfAccount,
        purchaseCost,
        plusTaxes,
        plusDeliveryCharges,
        plusConvenienceFee,
        plusTips,
        lessdiscounts,
        lessCouponsAppiled,
        pay,
        payByCash,
        headofAccount,
        billAmount,
        amountIn,
        cashpaid,
        balanceOutstanding,
        cashToReturn,
        applePay,
        googlePay,
        payPal,
        payByeWallet,
        loyaltyRedemption,
        loyaltyPointsBf,
        pointConversionRate,
        totalMoneyValue,
        thisBillAmount,
        balanceAmountIn,
        convertedBackToPoints,
        pointsEarnedThisBill,
        loyaltyPointsCf,
        payByGiftCard,
        giftCardRefunded,
        selectGiftCard,
        giftCardValue,
        numberOfGiftCards,
        valueOfGiftCards,
        PayByStoreCredit,
        approvedAmount,
        creditPeriodInDays,
        usedOn,
        dueOn,
        bal,
        amountPayableIn,
        payAmountIn,
        creditAvailableIn,
        rePayStoreCredit,
        orderConfirmation,
        thankYouForShopping,
        pleaseVisitAgain,
        oldOrders,
        dateOfOrder,
        amount,
        status,
        outletNameDate,
        totalPaid,
        myShop,
        pending,
        shoppingList,
        quantity,
        pendingOrders,
        totalItems,
        totalCost,
        productBarcodeScan,
        freeFlowShopping,
        shopAtStoreWeigh,
        weight,
        cost,
        shopByList,
        qtyRequired,
        qtyPicked,
        shopAtStore,
        shopAtStorePay,
        addOns,
        review,
        reviewStore,
        store,
        product,
        myComments,
        everyReviewEarnsLoyaltyPoints,
        reviewProduct,
        serviceCharges,
        subscription,
        convenienceFee,
        addFamilyMembers,
        sameAddress,
        different,
        relationship,
        email,
        share,
        yourMobileNumber,
        yourFriendName,
        yourFriendMobileNumber,
        shareMobileNumberToInvite,
        messaging,
        messages,
        messagesSend,
        coupons,
        support,
        expertViews,
        faq,
        resources,
        termsAndConditions,
        configure,
        jewellery,
        selectShop,
        jewelleryShops,
        necklace,
        referenceNumber,
        subCategory,
        arTryOn,
        selectImage,
        takePhoto,
        chooseFromgallery,
        cancel,
        addressSecond,
        addressFirst,
        stateOrProvince,
        postalCode,
        mailId,
        forgotPassword,
        firstTime,
        logOutConformation,
        quitConformation,
        changePasswordInfo,
        resentOtpInfo,
        users,
        installer,
        logout,
        login,
        resetPassword,
        language,
        languageOfOperation,
        credits,
        skip,
        selectLanguage,
        recogniseContry,
        welcome,
        verifyMobileNumber,
        locationPermissionError,
        locationDeniedError,
        mandatoryMailId,
        defauldLanguage,
        otpInfo,
        info,
        locationServicesAreDisable,
        LocationPermissionsAreDenied,
        createPassword,
        success,
        RestartApp,
        profile,
        assetsDownloadFailed,
        profileError,
        loginFailed,
        otpNotSent,
        somethingWentWrong,
        otpNotSentFailed,
        enterMailToProceed,
        skipOnce,
        skipAlways,
        pressAndHold,
        toAddNewAddress,
        disc,
        monthly,
        yearly,
        purchaseValueLimited,
        noIngredientsFound,
        noNutritionFound,
        prodectImage,
        tabThePlaceholder,
        changeDeliveryAddres,
        comments,
        updateYourShopDetails,
        updateYourConfigureDetails,
        changeCountryDetails,
        failed,
        printBill,
        currentShoppingModeFirst,
        currentShoppingModeSecond,
        currentRetailVerticalFirst,
        currentRetailVerticalSecond,
        noOffersFound,
        punctuality,
        service,
        productQuality,
        productVariety,
        easeOfOrdering,
        nutritionalValue,
        variety,
        packaging,
        quality,
        yesSym,
        bill,
        eCommerceMode,
        noPermission,
        defaultText,
        continueText,
        userName,
        greeting,
        profileUpdated,doYouReallyWantToDeleteThisItem,
        areYouSureWantToDeleteThisUser,
        searchProduct,
        next,
        failedToFetchCountry,
        verticalUpdatedSuccessfully,
        theLocationServicesAreUsed,
        pause,
        resume,
        neighbourhoodCafe,
        userSettings,
        calculate,
        cameraFacing,
        loading,
        productCategories,
        subCatagoryFilter,
        restaurant,
        restaurantType,
        addressBook,
        currentSettings,
        add_OnsDetails,
        usersettings,
        reviewDetails,
        payDetails,
        productSuperCategories,
        categories,
        enroll,
        browse,
        browseMethod,
        guestCity,
        selectCity,
        guestCountry,
        selectCountry,
        asGuestUser,
        theCurrentRetailVertical,
        youHaveSelectedCountry,
        restartApp,
        directFeatureAccess,
        resendOTP,
        clientImage,
        ratings,
        subCategoryFilteredby,
        customerRating,
        confirm,
        selectFromWhichCurrency,
        deliverySecurityCode,
        yourOrderNumber,
        orderSuccessfullyPlaced,
        yourOrderWillBeProcessed,
        thankYouForShoppingus,
        scanACode,
        open,
        closes,
        phone,
        distanceToShop,
        max_ProductAvailability,
        lowestOverallCost,
        bestQualityAsPerRatings,
        deliverySpeed,
        catalogueOfItems,
        enterDinerData,
        numbeOfGuests,
        numberOfBills,
        productMainCategories,
        productSubCategories,
        promotion,
        selectArea,
        selectShoppingMode,
        youHaveClickedOnADDICONTapOnRegisterNewICON,
        pleaseLoginFirstToAddThisProductToYourWishList,
        payByCard,
        tapOnTheEditIconAfterEnterTheProfileDetails,
        payeeMobileNumber,
        youHaveClickedOnCARTICONTapOnRegisterNewICON,
        Youcanselectacountryofoperation,
        YouhaveselectedIndiaasthecountry

      
      ];

  const LanguageResponse(
      {this.clientRegistration,
      this.clientAssist,
      this.error,
      this.mobileNumber,
      this.resendOtp,
      this.mobileOwnerDetails,
      this.home,
      this.office,
      this.firstName,
      this.lastName,
      this.location,
      this.city,
      this.ownerDetails,
      this.user,
      this.client,
      this.firstTimeUser,
      this.password,
      this.provideMailId,
      this.confirmMailId,
      this.otpIncorrectError,
      this.repeatPassword,
      this.passwordConstruct,
      this.ChnagePwdInfo,
      this.PwdMissMatchError,
      this.newPwdCreated,
      this.newPassword,
      this.resetPwdCreated,
      this.welcomeClient,
      this.personalProfile,
      this.clientPicture,
      this.province,
      this.state,
      this.pinCode,
      this.dateOfBirth,
      this.changePassword,
      this.confirmOwnership,
      this.oldPassword,
      this.changePwdCreated,
      this.changeCountry,
      this.shoppingSettings,
      this.lastConfiguration,
      this.shoppingMode,
      this.retailVertical,
      this.deliveryMode,
      this.deliveryAddress,
      this.shop,
      this.deliveryTime,
      this.shoppingReview,
      this.selectDeliveryAddress,
      this.select,
      this.delete,
      this.addNewAddress,
      this.configInfo,
      this.changeShopMode,
      this.changeRetailVertical,
      this.selectRetailVertical,
      this.changeDeliveryMode,
      this.changeDeliveryAddress,
      this.caution,
      this.deleteAddress,
      this.yes,
      this.no,
      this.addDeliveryAddress,
      this.selectStore,
      this.changeStore,
      this.list,
      this.terms,
      this.pictureOfStore,
      this.name,
      this.operatingTime,
      this.catalogue,
      this.changeDeliveryTime,
      this.cancelOrder,
      this.deviceFeedback,
      this.haptic,
      this.systemSound,
      this.hapticPowerConsumptio,
      this.defaultLanguage,
      this.newOrder,
      this.promotions,
      this.offerFromCpgCompanies,
      this.gocheckoutAt,
      this.now,
      this.notNow,
      this.shopName,
      this.selectCategory,
      this.sku,
      this.price,
      this.subCategory1,
      this.subCategory2,
      this.selectSubCategory,
      this.items,
      this.productName,
      this.picture,
      this.ingredients,
      this.nutrition,
      this.offers,
      this.inStock,
      this.substitute,
      this.wishList,
      this.manufacturer,
      this.brand,
      this.category,
      this.buyOneGetOne,
      this.shopNewOrder,
      this.reviewCart,
      this.itemName,
      this.qty,
      this.total,
      this.discounts,
      this.taxes,
      this.totalPayable,
      this.checkout,
      this.addTips,
      this.noThanks,
      this.byValue,
      this.percentOfPurchase,
      this.reviewPayment,
      this.headOfAccount,
      this.purchaseCost,
      this.plusTaxes,
      this.plusDeliveryCharges,
      this.plusConvenienceFee,
      this.plusTips,
      this.lessdiscounts,
      this.lessCouponsAppiled,
      this.pay,
      this.payByCash,
      this.headofAccount,
      this.billAmount,
      this.amountIn,
      this.cashpaid,
      this.balanceOutstanding,
      this.cashToReturn,
      this.applePay,
      this.googlePay,
      this.payPal,
      this.payByeWallet,
      this.loyaltyRedemption,
      this.loyaltyPointsBf,
      this.pointConversionRate,
      this.totalMoneyValue,
      this.thisBillAmount,
      this.balanceAmountIn,
      this.convertedBackToPoints,
      this.pointsEarnedThisBill,
      this.loyaltyPointsCf,
      this.payByGiftCard,
      this.giftCardRefunded,
      this.selectGiftCard,
      this.giftCardValue,
      this.numberOfGiftCards,
      this.valueOfGiftCards,
      this.PayByStoreCredit,
      this.approvedAmount,
      this.creditPeriodInDays,
      this.usedOn,
      this.dueOn,
      this.bal,
      this.amountPayableIn,
      this.payAmountIn,
      this.creditAvailableIn,
      this.rePayStoreCredit,
      this.orderConfirmation,
      this.thankYouForShopping,
      this.pleaseVisitAgain,
      this.oldOrders,
      this.dateOfOrder,
      this.amount,
      this.status,
      this.outletNameDate,
      this.totalPaid,
      this.myShop,
      this.pending,
      this.shoppingList,
      this.quantity,
      this.pendingOrders,
      this.totalItems,
      this.totalCost,
      this.productBarcodeScan,
      this.freeFlowShopping,
      this.shopAtStoreWeigh,
      this.weight,
      this.cost,
      this.shopByList,
      this.qtyRequired,
      this.qtyPicked,
      this.shopAtStore,
      this.shopAtStorePay,
      this.addOns,
      this.review,
      this.reviewStore,
      this.store,
      this.product,
      this.myComments,
      this.everyReviewEarnsLoyaltyPoints,
      this.reviewProduct,
      this.serviceCharges,
      this.subscription,
      this.convenienceFee,
      this.addFamilyMembers,
      this.sameAddress,
      this.different,
      this.relationship,
      this.email,
      this.share,
      this.yourMobileNumber,
      this.yourFriendName,
      this.yourFriendMobileNumber,
      this.shareMobileNumberToInvite,
      this.messaging,
      this.messages,
      this.messagesSend,
      this.coupons,
      this.support,
      this.expertViews,
      this.faq,
      this.resources,
      this.termsAndConditions,
      this.configure,
      this.jewellery,
      this.selectShop,
      this.jewelleryShops,
      this.necklace,
      this.referenceNumber,
      this.subCategory,
      this.arTryOn,
      this.selectImage,
      this.takePhoto,
      this.chooseFromgallery,
      this.cancel,
      this.addressSecond,
      this.addressFirst,
      this.stateOrProvince,
      this.postalCode,
      this.mailId,
      this.forgotPassword,
      this.firstTime,
      this.logOutConformation,
      this.quitConformation,
      this.changePasswordInfo,
      this.resentOtpInfo,
      this.users,
      this.installer,
      this.logout,
      this.login,
      this.resetPassword,
      this.language,
      this.languageOfOperation,
      this.credits,
      this.skip,
      this.selectLanguage,
      this.recogniseContry,
      this.welcome,
      this.verifyMobileNumber,
      this.locationPermissionError,
      this.locationDeniedError,
      this.mandatoryMailId,
      this.defauldLanguage,
      this.otpInfo,
      this.info,
      this.locationServicesAreDisable,
      this.LocationPermissionsAreDenied,
      this.createPassword,
      this.success,
      this.RestartApp,
      this.profile,
      this.assetsDownloadFailed,
      this.profileError,
      this.loginFailed,
      this.otpNotSent,
      this.somethingWentWrong,
      this.otpNotSentFailed,
      this.enterMailToProceed,
      this.skipOnce,
      this.skipAlways,
      this.pressAndHold,
      this.toAddNewAddress,
      this.disc,
      this.monthly,
      this.yearly,
      this.purchaseValueLimited,
      this.noIngredientsFound,
      this.noNutritionFound,
      this.prodectImage,
      this.tabThePlaceholder,
      this.changeDeliveryAddres,
      this.comments,
      this.updateYourShopDetails,
      this.updateYourConfigureDetails,
      this.changeCountryDetails,
      this.failed,
      this.printBill,
      this.currentShoppingModeFirst,
      this.currentShoppingModeSecond,
      this.currentRetailVerticalFirst,
      this.currentRetailVerticalSecond,
      this.noOffersFound,
      this.punctuality,
      this.service,
      this.productQuality,
      this.productVariety,
      this.easeOfOrdering,
      this.nutritionalValue,
      this.variety,
      this.packaging,
      this.quality,
      this.yesSym,
      this.bill,
      this.eCommerceMode,
      this.noPermission,
      this.defaultText,
      this.continueText,
      this.userName,
      this.greeting,
      this.profileUpdated,
      
    this.doYouReallyWantToDeleteThisItem,
    this.areYouSureWantToDeleteThisUser,
    this.searchProduct,
    this.next,
    this.failedToFetchCountry,
    this.verticalUpdatedSuccessfully,
    this.theLocationServicesAreUsed,
    this.pause,
    this.resume,
    this.neighbourhoodCafe,
    this.userSettings,
    this.calculate,
    this.cameraFacing,
    this.loading,
    this.productCategories,
    this.subCatagoryFilter,
    this.restaurant,
    this.restaurantType,
    this.addressBook,
    this.currentSettings,
    this.add_OnsDetails,
    this.usersettings,
    this.reviewDetails,
    this.payDetails,
    this.productSuperCategories,
    this.categories,
    this.enroll,
    this.browse,
    this.browseMethod,
    this.guestCity,
    this.selectCity,
    this.guestCountry,
    this.selectCountry,
    this.asGuestUser,
    this.theCurrentRetailVertical,
    this.youHaveSelectedCountry,
    this.restartApp,
    this.directFeatureAccess,
    this.resendOTP,
    this.clientImage,
    this.ratings,
    this.subCategoryFilteredby,
    this.customerRating,
    this.confirm,
    this.selectFromWhichCurrency,
    this.deliverySecurityCode,
    this.yourOrderNumber,
    this.orderSuccessfullyPlaced,
    this.yourOrderWillBeProcessed,
    this.thankYouForShoppingus,
    this.scanACode,
    this.open,
    this.closes,
    this.phone,
    this.distanceToShop,
    this.max_ProductAvailability,
    this.lowestOverallCost,
    this.bestQualityAsPerRatings,
    this.deliverySpeed,
    this.catalogueOfItems,
    this.enterDinerData,
    this.numbeOfGuests,
    this.numberOfBills,
    this.productMainCategories,
      this.productSubCategories,
      this.promotion,
      this.selectArea,
      this.selectShoppingMode,
      this.youHaveClickedOnADDICONTapOnRegisterNewICON,
      this.pleaseLoginFirstToAddThisProductToYourWishList,
      this.payByCard,
      this.tapOnTheEditIconAfterEnterTheProfileDetails,
      this.payeeMobileNumber,
      this.youHaveClickedOnCARTICONTapOnRegisterNewICON,
      this.Youcanselectacountryofoperation,
      this.YouhaveselectedIndiaasthecountry
      });
}
