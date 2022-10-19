// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //A hele, copak to tu máme, to už ses zase pøiplet do cesty starýmu Skipovi?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //(pøehnanì) Já tì znám!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Zátoka u mìsta, pamatuješ?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip, že jo?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //(hrdì) Vidím, že jsem na tebe udìlal dojem.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale mezitím jsem ten tvùj ksicht zahlíd i JINDE.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //Ale jistì!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //No, podoba sice nic moc, ale urèitì seš to TY!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Si to tak neber, já na tìch plakátech vypadám úplnì stejnì blbì.
	Npc_ExchangeRoutine	(self,"Zaèít");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Mám tu pro tebe balíèek, který ti posílá Baltram.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Mám pro tebe balík od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //(šklebí se) To teda musel fakt pøebrat, když nám svý zboží posílá až SEM.
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Tumáš, dej mu tyhle dvì flašky rumu. Tu tøetí jsem vyslopal, když jsem tu na nìj èekal.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tady dìláš?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tu dìláš?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Právì jsem se vrátil z Khorinidu a teï èekám, až se vrátí Greg.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "V Khorinidu jsem vidìl Grega.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Grega jsem vidìl v Khorinidu.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Vážnì? A sakra! To se nìco muselo pìknì podìlat!
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Už pøed èasem mìl bejt tady i s naší lodí.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //(zamyšlenì) Myslím, že bych se mìl vrátit do Khorinidu a poèkat na nìj tam.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //(povzdech) Ale urèitì ne dneska, dyk jsem sotva dorazil.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Mùžeš mì zavést do Khorinidu?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Mùžeš mì dopravit do Khorinidu?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Ani nápad, zrovna jdu pryè. Musím si napøed dát poøádnýho loka koøalky.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zbláznil ses? Dyk jsme pøišli vo LOÏ, èoveèe!
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nebudu vytahovat naši poslední loï jenom proto, že seš línej pohnout zadkem a dostat se do Khorinidu SÁM!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Naposledy: NE!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co bys mi øekl o tìch banditech?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co bys mi povìdìl o banditech?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //O banditech? Útoèej na nás!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Proè si myslíš, že stavíme tu palisádu?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //A to jsme sem ty šmejdy sami dopravili.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Døív jsme s nima vobchodovali. Ti maj tolik zlata, že nevìdìj, co s ním, to ti øeknu!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Za flašku rumu by zaplatili cokoliv.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale ty doby už jsou dávno pryè. Teï spolu válèíme!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co se stalo?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ti hajzlové nezaplatili za poslední dodávku.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //Tak jsem za nima šel, abych zjistil, co se stalo s naším zlatem.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Jenže sotva jsem vlez do bažiny, ty svinì na mì zaútoèily!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //A to ještì není všecko. Zabili Anguse a Hanke! Dva naše nejlepší lidi!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Takže bych ti radil, aby ses vod tý bažiny držel dál.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Jdou po každým, kdo nevypadá stejnì vošuntìle jak voni.
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Potøebuji zbroj banditù.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Potøebuju zbroj banditù.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Ty tam chceš jít? Zbláznil ses? 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Jestli zjistìj, že k nim nepatøíš, nadìlaj z tebe sekanou!
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Máš ponìtí, kde bych takovou zbroj sehnal?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //(s povzdechem) Ty se jen tak nevzdáš, co? No dobøe, jeden kousek jsme tu mìli.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Greg ho má nejspíš poøád ve svý chajdì.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Možná by ti ji moh prodat, až se vrátí.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip se domnívá, že zbroj by mìla být v Gregovì chatrèi."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "Nevíš, jak se dostanu do Gregovy chatrèe?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //Neporadil bys mi, jak se do té jeho chajdy dostat?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Tak to prrr! Ne tak rychle!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Snad tì nenapadlo, že by ses Gregovi hrabal ve vìcech, že ne?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Když vodjíždìl, svìøil klíè Francisovi a nakázal mu, aby do jeho chajdy NIKOHO nepouštìl.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis má klíè ke Gregovì chatrèi, ale dostal rozkaz, aby tam nikoho nepouštìl."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co bys mi øekl o Francisovi?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co bys mi prozradil o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //Francis je náš pokladník.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapitán mu vìøí - a nejspíš proto mu taky svìøil velení.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Jenže nikdo z chlapù ho nebere vážnì.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Jestli chceš vìdìt víc, promluv si se Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Hledal klid, a tak se usadil v malý jeskyni na severu.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //V táboøe není ani živá duše. Samuel NEVÍ úplnì o všem.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Mìl bych si promluvit se Samuelem, tøeba mi pomùže."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Setkal ses nìkdy s Havranem?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Setkal ses nìkdy s Havranem?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Jasnì, když jsem byl s Henrym u brány, vidìl jsem, jak Havran poslal pár svejch chlapù do vìže na jihu.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Vocuï z tábora je to co by kamenem dohodil. (smìje se) Nejspíš nás maj špehovat.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //A taky jsem vidìl, jak vyhrožuje svejm lidem, který ho nechtìli poslouchat.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //S každým, kdo do puntíku nesplní jeho rozkazy, udìlá krátkej proces.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Dej na mì: vod Havrana se drž dál.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Povìz mi o Angusovi a Hankovi nìco víc.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Povìz mi víc o Angusovi a Hankovi.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus a Hank se mìli pøed táborem setkat s òákejma banditama.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Nesli všechny možný zásoby. Všecko, co si u nás ti parchanti vobjednali.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kujnou ocel, paklíèe a kdo ví co ještì. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Ale nikdy se už nevrátili. Ta svinì banditská je urèitì vodkráglovala!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan a Bill po nich pátrali, ale bez úspìchu.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill byl pìknì znièenej – voba byli naši kámoši.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Je eštì mladej, takže si to moc bere.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //My vostatní jsme to zvládli bez problémù. To zboží si mùžem dovolit ztratit. (povzdech) Ale mìli u sebe i spoustu koøalky...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //(rozzuøenì) Mluvím aspoò o 20 lahvích!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Banditi prý Skipovi ukradli 20 lahví koøalky. Chce své lahve zpátky.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank se nejspíš setkali s tlupou banditù. Pak už je nikdo nevidìl.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Hledání Morgana a Billa je stále neúspìšné.");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "K Angusovi a Hankovi...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Co se týèe Anguse a Hanka...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Co?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Našel jsem je.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Jsou mrtví.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //(pro sebe) Takže zaklepali baèkorama – chudáci!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //No, ale to se dalo èekat.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Mìl by sis promluvit s Billem, jestlis to už neudìlal.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale øekni mu to šetrnì, je eštì mladej.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Už vím, kdo zabil Anguse a Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Vím, kdo zabil Anguse a Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //Tak to máš kliku, jenže voba jsou mrtví, tak kdo by se vo to víc staral?
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Pomstou eštì nikdy žádnej pirát nezbohatnul.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Hlavnì jestli dostanu zpátky svojí koøalku.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Je mi fuk, kdo je zabil, ale kde je moje koøalka?!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "Tady máš svých 20 lahví.";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //Co se týèe tý koøalky...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Tady máš svých 20 lahví.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Postrádáš 20 lahví, že jo?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Jo, sakra, všecky mý zásoby.
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Tady máš svých 20 lahví.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip dostal zpátky svých 20 lahví koøalky a je spokojený.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Cože? Fakt? Jen tak?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //Noooo...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //No dobøe, zaplatím ti za nì.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Nemáš nìco zajímavìjšího než zlato?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmm, mrknu se. Mám tu tuhlecten prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Pøed lety jsem ho vyhrál v jedný zaplivaný pøístavní krèmì.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Tenkrát ten chlápek tvrdil, že je magickej, ale nemám tucha, jestli je to pravda.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Chtìl bys ho místo penìz?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi peníze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Dej mi prsten.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Dej mi ten prsten.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Tumáš.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Dej mi peníze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Fajn.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Máš nìco na prodej?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Nemáš nìco na prodej?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Jestli chceš vobchodovat, zajdi za Garettem, ten se nám stará vo zásoby.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Máš mi prý pomoci.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Máš mi pomoct.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //S èím?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Kaòon èeká.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Vidím, že sis vzal ještì pár chlapù, výbornì! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Radši si s sebou vem ještì pár chlapù!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Ten kaòon je pekelnì nebezpeènej!
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "Pojï se mnou.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //Pojï se mnou.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Poèkej, napøed se vrátíme do kaòonu...
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //Pojïme!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Už tì nepotøebuju.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Už tì nepotøebuju.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //No tak dobøe, sejdeme se v táboøe.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To už je dost daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Jestli chceš jít dál, tak s náma nepoèítej!
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Jestli chceš jít dál, tak se mnou nepoèítej!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Jestli se nìjak ztratíme, sejdem se tady.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Tak pojïme!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Skøeti! Nesnáším skøety!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Nejspíš už jsme zlikvidovali všecky bøitovce.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Ale jestli chceš, mùžem tu ještì chvíli pobíhat.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Pokud zùstanem v kaòonu. 
	
	AI_StopProcessInfos (self); 
};


