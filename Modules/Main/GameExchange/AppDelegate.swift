//
//  AppDelegate.swift
//  GameExchange
//
//  Created by Abdulrahman Essa on 13/07/2021.
//

import UIKit
import Games
import HomePage
import AVFoundation
import AVKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let entryVC = BarqTabBar()
    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()

        window?.rootViewController = entryVC
        window?.makeKeyAndVisible()
        
        findCount()
        return true
    }
    
    func findCount() {
        
        var counts: [String: Int] = [:]

        for item in rec {
            counts[item] = (counts[item] ?? 0) + 1
        }

        print(counts)  // "[BAR: 1, FOOBAR: 1, FOO: 2]"

        for (key, value) in counts {
            print("\(key) occurs \(value) time(s)")
        }
    }
    var rec =
    [
        "M4G4TT4CK",
        "Rubymeuh",
        "Reagonfly",
        "Lonèa",
        "Claud4465",
        "FlinkNsounD",
        "droaks",
        "MaStEr32",
        "Mcrussia",
        "Irish Lord91",
        "MilesEdgey",
        "Gosupp",
        "Docteur Strange",
        "MaDnEsS89",
        "Powerbtm",
        "Pipi Caca",
        "AliceKy",
        "DenkuSama",
        "Napolistyle",
        "JhonnySi",
        "wMiGw",
        "ioxi",
        "Forsaken Impaler",
        "anonymusec",
        "smbkrlk",
        "RunScarletHeart",
        "SKBLCK",
        "despair",
        "aure721",
        "AvvenC",
        "Tallys 62",
        "Irarius",
        "Jerde131313",
        "Airnexx",
        "GINNOKEN",
        "LuxTft",
        "fkndarkness",
        "Betty Ballerina",
        "F3arTh3Jungl3",
        "Giga Blip Blop",
        "kalditodepollo",
        "We3eDst4r",
        "GrandLineWinner",
        "Vanilla Thunder",
        "CallmeSweetfart",
        "YoAboud",
        "SrVerde99",
        "syborg jé",
        "Dethdok",
        "Ap6uz",
        "Storm",
        "Erogenchik HF",
        "AsHn0",
        "9ine11leven",
        "always trouble",
        "deiv420",
        "Pure Talent",
        "Biska Droppar",
        "GunzNPotato",
        "Jo072543",
        "Veryox",
        "Dlinniypenus",
         "Leαgue of pain",
        "PrincessCybold",
        "Lenley",
        "PoleAxe",
        "jimbom95",
        "Charming Blades",
        "Bernie Flanders",
        "Erician",
        "Sasako36",
        "tenzous",
        "R3ssP3cT",
        "HIpOgLuCIdoOo",
        "Wächter",
        "gdog1",
        "Mystic Dale",
        "Cosmeas",
        "Meidera",
        "emansipaciya",
        "LILMERCUR",
        "Essindraa",
        "Aftershock User",
        "HuNTeRMaMBaMN",
        "Badrino00",
        "stadodo",
        "Wirrum",
        "HHannYY",
        "JuPitoEr",
        "Shravan",
        "Syphilis",
        "DrDrusan",
        "ElderBeastZ",
        "Madre Faesima",
        "Sdaaaaa7",
        "Nubmarine1",
        "angelinapiccina",
        "AyaPapayuhhh",
        "bypoolg",
        "Tessica96",
        "Makamaka",
        "Raijin0226",
        "Majoestg",
        "Moessias",
        "pxrsx",
        "R a g é z",
        "Charlie Sheen",
        "escaneko",
        "Francistrepo",
        "Junior",
        "samsamsamsam4",
        "rimbaby",
        "SizoVA",
        "Chieee",
        "Wulfenhammer",
        "bongbam",
        "ysdrizor",
        "LuckyNumbSl7vin",
        "BotSnaKe",
        "Sausende Biene",
        "MegaCrunchi",
        "Gitanatibs",
        "SilverBerluscon1",
        "ysdrizor",
        "AvvenC",
        "Crazy Juniors",
        "VonHalzen",
        "awe marius",
        "maranesline",
        "Fistonkiller",
        "pnzmel",
        "Jamal",
        "Haku",
        "Tyrone",
        "Cazatortugas0ReB",
        "TROKAL90",
        "Send socks pls",
        "rza36",
        "partybubs",
        "The Civ",
        "Joulukinkku",
        "criminal player",
        "temppxeehsxaxqhq",
        "Voffeli",
        "Lily",
        "Bumsiii",
        "Ferry Ortitorico",
        "Bostonare",
        "Kakans89",
        "Silentsnow",
        "La Badgyal",
        "Asian Amateur",
        "kaljakeiju",
        "BiggestLolkidxD",
        "RennyRennyChoppy",
        "meer",
        "COPALO",
        "BabyBirdYoongi",
        "Joharran123",
        "Melkyon",
        "DaManeManfred",
        "BattleNogare",
        "Tommy Wood",
        "KnuckleJoestar",
        "BraL33 ZA",
        "Mano974",
        "Luzo18",
        "DasBirne",
        "SooTempest",
        "Duško Krtöla",
        "Latorre17",
        "Pacamara",
        "Velnas",
        "RakitaRakita7",
        "moni cr7",
        "PKC Ayi",
        "Marmelade008",
        "Auguste the best",
        "AlvaroFM",
        "H0RnY Jelly",
        "LöschSchiggy",
        "Bird of Freljord",
        "Twisted",
        "DarkGautham",
        "kickedgarlic",
        "OnTopWithNoTopOn",
        "Tham Grag",
        "Killeer99",
        "Sokke Runkeren",
        "arkangelsb",
        "Sailor Mercury",
        "NILLΛ",
        "God timmy",
        "billyhoyler",
        "H1story",
        "aliceuvz",
        "sysy97",
        "goweb",
        "amer1990vip",
        "Top Shen EU",
        "Hitcherlagos",
        "Ahmed Salim",
        "IbinReal96",
        "maynu61010",
        "Essindraa",
        "Hátéd",
        "Megami Fumei",
        "Badrino00",
        "whocarez7",
        "Gwyn",
        "ÉcailleLumineuse",
        "Miguelgarath",
        "arroow72",
        "LegovogeL",
        "Tofu",
        "Druffi 4twenty",
        "wazzup21",
        "Hedged",
        "MicrobZz",
        "SmollTerrorizt",
        "luciafusterr",
        "samurai tony",
        "HoppinBunno",
        "jarjoti",
        "Raykigro",
        "Flokynus",
        "Zesty2257",
        "jesosy",
        "Mr oizo de",
        "SergioNYP",
        "PlagueBlackDeath",
        "Vanity Zeri",
        "djoodragon",
        "BLAZERKID",
        "Luca Ouji",
        "Meireles",
        "Spyrosa",
        "SMF Senpai",
        "Weezo1791",
        "JakyLovee",
        "Friends in Paris",
        "DjChrispyChicken",
        "rövhattarn",
        "nSauer",
        "Toujo",
        "El BuBius",
        "LeTh1b4ut",
        "GrikiuGranola",
        "Mehrfleischmann",
        "cuteasducks",
        "ZaiKen X",
        "Lilipadmaid",
        "kerzyy",
        "MrAram",
        "Wijk3n",
        "Warlock Yanglow",
        "Dudu55",
        "IDontCarryYouXD",
        "pietertje1648",
        "Arkary Roxette",
        "IightofEärendil",
        "hurnen",
        "LeaMTS",
        "OssoDeSeppa",
        "HaramBreab",
        "Pixelgunner",
        "Imminence",
        "Ehyzi",
        "Morgorn",
        "Archadius88",
        "Ghengy",
        "Kama3110",
        "Oterhalsn",
        "Feris23",
        "vinsnova",
        "HigashiDonE",
        "TheShooters",
        "SymokoBloupie",
        "whydoupush",
        "ednamodtamere",
        "TheDani005",
        "Xezbeth98",
        "PoH0p3",
        "Russoldat",
        "IDeXon",
        "kanssadin",
        "Disconnecter7",
        "ShuloTR",
        "ForeverAloneJojo",
        "Alexblanquez03",
        "MrHawk5",
        "DupontMartin",
        "Schonse",
        "Alahri",
        "Distrokeed",
        "Lénôr",
        "MrBoss",
        "Kitty Femboy",
        "Plagued Pangolin",
        "StreetJhin",
        "PANNA E FRAGOLA",
        "El Coronao",
        "Aliséa Vampaya",
        "MFTW Akachupawer",
        "skyray69",
        "oget27",
        "RatonÔCurry",
        "Askannon",
        "SBWinsToNSB",
        "snooker miao",
        "MyBoiRaco",
        "Yi Wen Xuan",
        "Blackix9",
        "dajdazapalim",
        "Bedre end alle",
        "Quedumousseux",
        "Daishos Returns",
        "AstonMartin0ne77",
        "Mox001",
        "nexus105",
        "8twoo Rogii",
        "Krovn",
        "Leyflix",
        "Yasho",
        "ぷ Down",
        "Gagtungr",
        "InBlackestNight",
        "DancingMoose",
        "Pop the Stone",
        "Arthur555",
        "willou83",
        "MidgeNinja",
        "vasabaa",
        "Vinzant",
        "docmose",
        "ImperialBows",
        "Soft Cosmos",
        "Riyuk2",
        "OrYmSsAiD",
        "YouRDest",
        "Ankantor738",
        "ClaraShadow",
        "kumpurei",
        "m0nserr",
        "Juradido",
        "ferdara",
        "Tutuhihi",
        "deadskills",
        "Twotapped",
        "MysticShawna",
        "LunaLovegoody",
        "notM00n",
        "Schnaddelhaddel",
        "Dirome",
        "Gambabu",
        "MissFluffyMaliin",
        "LT Insane",
        "kdieh",
        "Luq of Doom",
        "Beardow",
        "exactixxx",
        "HEISENBERG G10",
        "Myrdsi",
        "Shravan",
        "Çoco",
        "RisingSun",
        "B A B A B A B S",
        "Oblivionjakes",
        "AlterHP",
        "Kötthög",
        "Lemon900",
        "大小姐的baba",
        "chilindrinaa",
        "tomo3003",
        "AndErs",
        "asuná",
        "Kochmafaka",
        "edga666",
        "juiceboxx",
        "Articorz",
        "Muffindoublechoc",
        "Aymara",
        "Rilow",
        "SniperAssassin",
        "Meowsical",
        "SlibSlobMyNibNob",
        "Matze3992",
        "Staggis",
        "Zowlettebis",
        "danipani15",
        "Sireniae",
        "Yvonnee",
        "DenjiWiener",
        "BruhPK",
        "gastric juice",
        "Zore the king",
        "ChuchiChat",
        "omgroflHax0r",
        "XxKravenxX",
        "Ezra Pyjama",
        "RageQtz",
        "Borralhoo",
        "ba7aa",
        "romejp451",
        "harry1607",
        "TallGuyT",
        "Ultrapultra",
        "K1ck4p00",
        "CrazyFormMatz",
        "sagaparkat",
        "Moonkey2711",
        "aZebedeusfia",
        "Sabzatron",
        "Emeliee",
        "Uksako",
        "Mala Od Skandala",
        "PrideStealer",
        "Ðestined Death",
        "Aelkimgor2",
        "Paco der klapper",
        "Night ØwŁ",
        "Carlitosgarry",
        "chatkira3",
        "Shrek",
        "Robbedoes",
        "SnoopGod",
        "Prukogi 69",
        "Tripotanouille",
        "ÖTP Baguette",
        "Gunsild123",
        "xxagatha",
        "Anumi",
        "kingtony1337",
        "Asmodzeus",
        "WALEEDSSJ",
        "justAwookie",
        "feveeer",
        "g4njaf4rmer",
        "TheGodDamnPope",
        "AyperosReturns",
        "LiLuu",
        "LiiiLu",
        "sanwerss",
        "LDSenior",
        "Manji",
        "jovanito",
        "Scárs",
        "isaacc91",
        "vndrespd",
        "Waffeli04",
        "Draky0",
        "JoggleProez",
        "AiNelya",
        "000bluebird000",
        "bog butter",
        "PrincessOlvo",
        "Litionator",
        "remramram",
        "chenzen",
        "Veqtix TFT",
        "I Like 2 Feed",
        "linusmmonz",
        "houhou",
        "Louis de Bourbon",
        "Padmé36",
        "Cursed Cygnus",
        "Void and Chaos",
        "CloseCloser",
        "TaYpan",
        "RudraDivide",
        "Ossyz",
        "El Economías2000",
        "Snuuusgott",
        "Cursed Cygnus",
        "il Faker ita",
        "Parad0x0505",
        "HuungrigerBär",
        "SaltRageJoe",
        "Zam Zam Uhm",
        "Chooan",
        "onlyhope123",
        "CarlyHunt",
        "Да это жестко",
        "Kaikou",
        "Rossenboy",
        "UnusualI",
        "Arthurkracht",
        "TheSaddestPotato",
        "TheBlackAries",
        "XOXCXIXNX",
        "ZeeDj",
        "jMedic",
        "holymowly",
        "DeSm1le",
        "BBQduck",
        "ILovNicola",
        "BOALBRK",
        "angelote96",
        "DeniBubu97",
        "jadouu38",
        "Rohan",
        "Chokladfindus",
        "Klempstein",
        "FireNox256",
        "DR Bibiii",
        "Curro14",
        "Mrožek",
        "Sr Boidkan",
        "RitØrd",
        "Riyuk2",
        "Fluffy Daddy",
        "Bluefalco",
        "moose",
        "Epaderm Cream",
        "THUNDER SOUP",
        "lapiflemme",
        "Ultra",
        "Alyzinha",
        "OngNoiMay",
        "Iam BadJesus",
        "VikingX10",
        "PtitGregoryx",
        "NoobsFinder",
        "despair",
        "Sadoramo",
        "K0denhob0ld914",
        "Chibrambulant",
        "KSIY Leviathan",
        "K3k1st4n3r",
        "five5",
        "ZeitgeistS04",
        "Mamboth",
        "ghazdose",
        "Cycrow95",
        "Tota Speedy",
        "lesbiannie",
        "Earhine",
        "Tripal Trickster",
        "Cat On A Taxi",
        "Alfrèdo",
        "qaz92to",
        "Sabinou",
        "HandlessDude",
        "J0jan60",
        "vicki99",
        "watermelonlord",
        "Sh4dow46",
        "DevaSerok",
        "I love Penta",
        "NinjaNut",
        "Kendrix",
        "ViegÒwÓ",
        "FlemeoEUW",
        "Buu Kuu",
        "Kimmy88",
        "Eight Immortals",
        "KatydieCarry",
        "BuuBees",
        "Mango",
        "Newbiex123",
        "Khyura",
        "UgandanTaric",
        "Macs",
        "flupmadriller",
        "Janana Boe",
        "AmagedonTomorrow",
        "be that guy",
        "he1lcat",
        "jhaiss",
        "PAVONEMAROCCHINO",
        "SN0WLAY",
        "qpmzyj",
        "Lololism",
        "Henfri",
        "CarlosKebabHouse",
        "skander718",
        "Thomaswt21",
        "skovyrne",
        "BastCaféChouchou",
        "cool pant cate",
        "<",
        "Sameen Shaw",
        "Yilara",
        "BADGYAL FLOW2000",
        "Konno Aiko",
        "Gundam1995",
        "PandaGamer25",
        "kerzyy",
        "Elujih",
        "Dimitrou49",
        "sorryzasayori",
        "Settantuno4",
        "Dereklol18",
        "SC00PDIDDYWH00P",
        "maui112211",
        "kraspy",
        "danikills14",
        "BlinblinPssBrkr",
        "brynja",
        "Bbokari",
        "ELCIBODINO",
        "NJoRD224",
        "A0YIN",
        "FlowerGnome",
        "ZM Saber",
        "Saint Jub",
        "Sid Atris",
        "eH Ipple",
        "ChickenRevenge",
        "AdFlXdvR",
        "Beo aka Omega",
        "Noshers123",
        "eddux",
        "Peppi",
        "BloxxACE",
        "A7X1996",
        "PBA Zanarkandt",
        "Ckaay",
        "Kappaccinos",
        "Gosho Aoyama",
        "KiLLaKingBurger",
        "TyrionTFT",
        "necromantica",
        "BIBI JTM",
        "TheShadows87",
        "travus",
        "Amborguesa",
        "TftWix",
        "AzZurlo",
        "ElChikit0Nubla0",
        "mahatma",
        "TMRsuperMario",
        "Fumo Dealer",
        "BennBeckman",
        "GreenTatou",
        "Nørup",
        "OG DaS05",
        "LooksLikeGragas",
        "onlycur",
        "Nexji",
        "iloveyouxme",
        "saambel",
        "xXniteXx",
        "kingo fayter",
        "Nokka",
        "giydue",
        "ANAIPROLAPSELEAK",
        "Shilmizta",
        "XenonzZZ",
        "Aurahh",
        "TheDeadKiller02",
        "Predateurx5",
        "saitamette",
        "Baidougas",
        "Qvist1212",
        "seeffx",
        "miike90",
        "suicastt",
        "Lizatha",
        "Just Sit Down",
        "Qvist1212",
        "Zeon",
        "troelie",
        "MightyTag9",
        "DragoBlack91",
        "ztert13",
        "bananatitgrab",
        "Zerschmetter1ing",
        "ChaosdragonDive",
        "Jamesc",
        "Mαsterbαiter",
        "Mueenou",
        "StripThies",
        "Vidict",
        "Bátman",
        "Ryuk",
        "Ilovenooobss<",
        "CanardClaqué",
        "joepazzo",
        "XenoxBS1",
        "MaxiGalaxi",
        "UNKN0W47",
        "Alexpel",
        "GreyWolfgham",
        "Carvalhan",
        "MC Wage Gap",
        "Djoks0",
        "Baileaf",
        "JamesQLF",
        "Larnouille",
        "Lord Biscuit 2nd",
        "come back again",
        "gianangeli",
        "Off Meta Builds",
        "Søønee",
        "Araulis",
        "Leiji",
        "Izettín",
        "Liintyus",
        "DOLENTÍSSIM",
        "ROGswift",
        "GoticaTtona",
        "Seemö",
        "GreenTatou",
        "Jambonsocial",
        "FocaFatta420",
        "Domsu",
        "Giotq",
        "Soshye",
        "LeeBraumzeJames",
        "Grougaloragran",
        "The Potato",
        "K Gwen Dios",
        "SideQuestNPC",
        "Antonia1301",
        "Pomme Cruise",
        "Ramsi Hartmann",
        "Dat Hydra",
        "LVT Arwinrz",
        "alexander811",
        "enjih",
        "Ramsi Hartmann",
        "BinEinPinguin",
        "Champi00v3",
        "RedBojolais",
        "Antonia1301",
        "Pippyyy",
        "Bones",
        "Finrod005",
        "CuBDS",
        "Mhisk",
        "xSamsungg",
        "DL Yutati",
        "Bastiflettte",
        "Arrix",
        "chigiri",
        "JR MORNINGSTAR",
        "Kunning",
        "BLVXB",
        "BLOBOB",
        "SirCk91",
        "fanieros",
        "doood",
        "Peppi",
        "Below The Ø",
        "Jhin Sakai",
        "Meτasτasi",
        "RVLT Gecko",
        "SaDitQuoii",
        "FateKng",
        "Skadis",
        "VINEUSAUR",
        "ßubbleš",
        "ThE aRt Of RiSk",
        "Ryugane",
        "Notfallmilch",
        "LOOΠΔ Hyeju",
        "LadyGetThatD",
        "Leiziix Decimus",
        "Pizza",
        "TochterPrio",
        "roj6488",
        "J3 brand",
        "BurgerTactica",
        "auxenRS",
        "Le Gentil Arbre",
        "Vlad Impalatope",
        "Hellpin",
        "FFLFeriouse",
        "taabigamer",
        "giogio95",
        "Doctor Ray"
    ]
}

