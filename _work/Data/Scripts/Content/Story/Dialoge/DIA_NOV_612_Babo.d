//***********************************************************************
//	Info EXIT 
//***********************************************************************
INSTANCE DIA_Babo_Kap1_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//***********************************************************************
//	Info Hello 
//***********************************************************************
INSTANCE DIA_Babo_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Babo_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (other.guild == GIL_NOV)
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Hello_Info()
{
	
	
	AI_Output (self ,other,"DIA_Babo_Hello_03_00"); //(ostýchavê) Buë zdráv, ty jsi tady také nový, co?
	AI_Output (other,self ,"DIA_Babo_Hello_15_01"); //Ano. Jak dlouho tady jsi?
	AI_Output (self ,other,"DIA_Babo_Hello_03_02"); //Zatím tady jsem ètyâi týdny. Dostal jsi už bojovou tyè?
	AI_Output (other,self ,"DIA_Babo_Hello_15_03"); //Zatím ne.
	AI_Output (self ,other,"DIA_Babo_Hello_03_04"); //Tak si vezmi tuhle. Každý novic dostane vlastní tyè - je symbolem toho, že je schopen se sám ubránit. Umíš bojovat?
	AI_Output (other,self ,"DIA_Babo_Hello_15_05"); //No, už jsem jednu nebo dvê zbranê v ruce držel.
	AI_Output (self ,other,"DIA_Babo_Hello_03_06"); //Kdybys chtêl, mùžu tê nêco nauèit. Mêl bych ale jednu prosbu...

	B_GiveInvItems (self,other,ITMW_1h_NOV_Mace,1);
	AI_EquipBestMeleeWeapon (self);
	
};
//***********************************************************************
//	Info Anliegen
//***********************************************************************
INSTANCE DIA_Babo_Anliegen   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent   = FALSE;
	description	= "Co bys potâeboval?";
};
FUNC INT DIA_Babo_Anliegen_Condition()
{
	if  (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (other, DIA_Babo_Hello))
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Anliegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_00"); //Co bys potâeboval?
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_01"); //No, jeden z paladinù, Sergio, je momentálnê tady v klášteâe.
	AI_Output (self ,other,"DIA_Babo_Anliegen_03_02"); //Kdyby se ti podaâilo ho pâemluvit, aby si se mnou párkrát zacvièil, nêco bych tê nauèil.
	AI_Output (other,self ,"DIA_Babo_Anliegen_15_03"); //Uvidím, co s tím pùjde dêlat.
	
	Log_CreateTopic (Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboTrain,LOG_RUNNING);
	B_LogEntry (Topic_BaboTrain,"Jestli se mi podaâí pâesvêdèit paladina Sergia, aby Baba trochu pocvièil v boji, nauèí mê bojovat obouruèními zbranêmi.");
	
};
//***********************************************************************
//	Info Sergio
//***********************************************************************
INSTANCE DIA_Babo_Sergio   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent   = FALSE;
	description	= "Hovoâil jsem se Sergiem.";
};
FUNC INT DIA_Babo_Sergio_Condition()
{
	if Npc_KnowsInfo (other, DIA_Sergio_Babo)
	&& (other.guild == GIL_NOV)
	
	
	{ 
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Sergio_Info()
{
	AI_Output (other,self ,"DIA_Babo_Sergio_15_00"); //Mluvil jsem se Sergiem. Bude tê trénovat dvê hodiny každé ráno, od pêti hodin.
	AI_Output (self ,other,"DIA_Babo_Sergio_03_01"); //Díky! Je to pro mê obrovská èest!
	AI_Output (self ,other,"DIA_Babo_Sergio_03_02"); //Kdybys chtêl, ukážu ti také nêjaké bojové finty.
	
	Babo_TeachPlayer = TRUE;	
	Babo_Training = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	B_LogEntry (Topic_KlosterTeacher,"Babo mê mùže vycvièit v obouruèním boji.");
};
//***************************************************************************************
//			Ich will trainieren
//***************************************************************************************
INSTANCE DIA_Babo_Teach(C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 100;
	condition	= DIA_Babo_Teach_Condition;
	information	= DIA_Babo_Teach_Info;
	permanent	= TRUE;
	description = "Jsem pâipraven na výcvik.";
};                       
//----------------------------------
var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;
//----------------------------------
FUNC INT DIA_Babo_Teach_Condition()
{
	if ((Babo_TeachPlayer == TRUE)
	&& (DIA_Babo_Teach_permanent == FALSE))
	|| (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
 
// -------------------------------
var int  babo_merk2h;
// -------------------------------
FUNC VOID DIA_Babo_Teach_Info()
{	
	babo_merk2h = other.HitChance [NPC_TALENT_2H]; 
	
	AI_Output (other,self ,"DIA_Babo_Teach_15_00"); //Jsem pâipraven na výcvik.
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);

};
FUNC VOID DIA_Babo_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output (self,other,"DIA_DIA_Babo_Teach_Back_03_00"); //Už ses nauèil o boji s obouruèními zbranêmi všechno, co znám.
		
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Babo_Teach);
};

FUNC VOID DIA_Babo_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_00"); //Bojuj za Innose. Innos je náš život - a tvá víra ti bude dávat sílu.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_01"); //Innosùv služebník nikdy svého protivníka neprovokuje - pâekvapí ho!
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_02"); //Aã jdeš kamkoliv, mêj svou tyè stále po ruce.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_03_03"); //Innosùv služebník je vždycky pâipravený k boji. Pokud ti nemùže posloužit magie, je tvojí nejvêtší obranou právê hùl.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};

FUNC VOID DIA_Babo_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75);
	
	if (other.HitChance [NPC_TALENT_2H]  >  babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_00"); //Innosùv služebník nebojuje jenom tyèí, ale také svým srdcem.
		};
		if (Babo_Labercount == 1)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_01"); //Vždycky musíš mít v pamêti místo, kam se mùžeš v pâípadê potâeby stáhnout.
		};
		if (Babo_Labercount == 2)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_02"); //Nezapomeà, že dobâe bojuješ v pâípadê, kdy svého protivníka ovládáš a nedáváš mu šanci, aby se ovládal sám.
		};
		if (Babo_Labercount == 3)
		{
			AI_Output (self,other,"DIA_DIA_Babo_Teach_2H_5_03_03"); //Prohraješ pouze v pâípadê, když se vzdáš.
		};
		
		Babo_Labercount = Babo_Labercount +1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;	
		};
	};
	
	Info_ClearChoices 	(DIA_Babo_Teach);
	Info_AddChoice 		(DIA_Babo_Teach,	DIALOG_BACK		,DIA_Babo_Teach_Back);
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Babo_Teach_2H_1);	
	Info_AddChoice		(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Babo_Teach_2H_5);	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Babo_Wurst(C_INFO)
{
	npc         = NOV_612_Babo;
	nr			= 2;
	condition	= DIA_Babo_Wurst_Condition;
	information	= DIA_Babo_Wurst_Info;
	permanent	= FALSE;
	description = "Tady máš klobásu.";
};                       

FUNC INT DIA_Babo_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Babo_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Babo_Wurst_15_00"); //Tady máš klobásu.
	AI_Output (self, other, "DIA_Babo_Wurst_03_01"); //Ach, skopová klobáska, výbornê! Chutnají vážnê výbornê - hele, dej mi ještê jednu!
	AI_Output (other, self, "DIA_Babo_Wurst_15_02"); //Pak mi jich už ale nezbude dost pro ostatní.
	AI_Output (self, other, "DIA_Babo_Wurst_03_03"); //Však jsi stejnê dostal o jednu víc. Tu pro sebe. A co je klobása mezi pâáteli?
	AI_Output (self, other, "DIA_Babo_Wurst_03_04"); //No tak, dám ti za ní svitek s kouzlem 'ohnivý šíp'.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Babo_Wurst);
	Info_AddChoice (DIA_Babo_Wurst,"No dobâe, tak si ještê vezmi.",DIA_Babo_Wurst_JA);
	Info_AddChoice (DIA_Babo_Wurst,"Ne, to by prostê nešlo.",DIA_Babo_Wurst_NEIN);
};
FUNC VOID DIA_Babo_Wurst_JA()
{
	AI_Output (other, self, "DIA_Babo_Wurst_JA_15_00"); //No dobâe, tak si ještê vezmi.
	AI_Output (self, other, "DIA_Babo_Wurst_JA_03_01"); //Bezva. Tady je ten svitek.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	B_GiveInvItems (self, other, ItSC_Firebolt, 1);
	
	Info_ClearChoices (DIA_Babo_Wurst);
};
FUNC VOID DIA_Babo_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Babo_Wurst_NEIN_15_00"); //Ne, to by prostê nešlo.
	AI_Output (self, other, "DIA_Babo_Wurst_NEIN_03_01"); //Chlape, že ty jsi jeden z têch, co berou všechno moc zodpovêdnê?
	Info_ClearChoices (DIA_Babo_Wurst);
};
//***********************************************************************
//	Was ist zwischen dir und Agon passiert? 
//***********************************************************************

INSTANCE DIA_Babo_YouAndAgon   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent   = FALSE;
	description	= "Co se stalo mezi tebou a Agonem?";
};

FUNC INT DIA_Babo_YouAndAgon_Condition()
{
	if Npc_KnowsInfo (other,DIA_Opolos_Monastery)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Babo_YouAndAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_YouAndAgon_15_00"); //Co se stalo mezi tebou a Agonem?
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_01"); //Ale to víš, trošku jsme se pohádali o to, jak se starat o ohnivé kopâivy.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_02"); //Agon je zaléval tak moc, že jim jednoho dne uhnily koâeny.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_03"); //A když se to stalo, tak to pak shodil na mê.
	AI_Output (self ,other,"DIA_Babo_YouAndAgon_03_04"); //Od té doby mê nenechají dêlat nic jiného než jen zametat dvùr.
};
//***********************************************************************
//	Warum hat Agon das getan?
//***********************************************************************
INSTANCE DIA_Babo_WhyDidAgon  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 4;
	condition   = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent   = FALSE;
	description	= "Proè to Agon udêlal?";
};
FUNC INT DIA_Babo_WhyDidAgon_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_WhyDidAgon_Info()
{
	AI_Output (other,self ,"DIA_Babo_WhyDidAgon_15_00"); //Proè to Agon udêlal?
	AI_Output (self ,other,"DIA_Babo_WhyDidAgon_03_01"); //Na to se ho budeš muset zeptat sám. Myslím, že nesnese pomyšlení na to, že by mohl být nêkdo lepší než on.
};
//***********************************************************************
//	Du hast wohl Ahnung von Pflanzen?
//***********************************************************************
INSTANCE DIA_Babo_PlantLore  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 5;
	condition   = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent   = FALSE;
	description	= "Zdá se, že se v rostlinách docela vyznáš.";
};
FUNC INT DIA_Babo_PlantLore_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_PlantLore_Info()
{
	AI_Output (other,self ,"DIA_Babo_PlantLore_15_00"); //Zdá se, že se v rostlinách docela vyznáš.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_01"); //Mùj dêdeèek mêl bylinkovou zahrádku, a tam jsem se pár vêcí nauèil.
	AI_Output (self ,other,"DIA_Babo_PlantLore_03_02"); //Vážnê bych byl rád, kdybych mohl znovu pracovat v zahradê.
	
	MIS_HelpBabo = LOG_RUNNING;
	Log_CreateTopic (Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus (Topic_BaboGaertner,LOG_RUNNING);
	B_LogEntry (Topic_BaboGaertner,"Babo by radši pracoval v bylinkáâské zahradê, než aby zametal dvùr.");
};
//***********************************************************************
//	Fegen
//***********************************************************************
INSTANCE DIA_Babo_Fegen  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 2;
	condition   = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent   = FALSE;
	description	= "Mám za úkol zametat v komnatách novicù.";
};
FUNC INT DIA_Babo_Fegen_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Fegen_Info()
{
	AI_Output (other,self ,"DIA_Babo_Fegen_15_00"); //Mám za úkol zametat v komnatách novicù.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_01"); //Tak to ti toho naložili docela dost. Víš co? Já ti pomùžu. Sám bys to nikdy nedodêlal.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_02"); //Strašnê nutnê ale potâebuji svitek s kouzlem 'vêtrná pêst'. Víš, mêl jsem štêstí a pâeèetl jsem si o nêm knihu.
	AI_Output (self ,other,"DIA_Babo_Fegen_03_03"); //Teë si pochopitelnê chci to kouzlo vyzkoušet. Pâines mi tedy ten svitek a já ti pomohu.
	
	B_LogEntry 	(Topic_ParlanFegen,"Babo mi pomùže zamést komnaty novicù, když mu pâinesu svitek vêtrné pêsti.");
};
//***********************************************************************
//	Windfaust abgeben
//***********************************************************************
INSTANCE DIA_Babo_Windfaust  (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 3;
	condition   = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent   = TRUE;
	description	= "Co se týká toho svitku... (PÂEDAT VÊTRNOU PÊST)";
};
//---------------------------------
var int DIA_Babo_Windfaust_permanent;
//---------------------------------
FUNC INT DIA_Babo_Windfaust_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Babo_Fegen))
	&& (DIA_Babo_Windfaust_permanent == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Babo_Windfaust_Info()
{
	AI_Output (other,self ,"DIA_Babo_Windfaust_15_00"); //Co se toho svitku týèe...
	AI_Output (self ,other,"DIA_Babo_Windfaust_03_01"); //Máš pro mê to kouzlo vêtrná pêst?
	
	if B_GiveInvItems (other, self, ItSc_Windfist,1)
	{ 
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_02"); //Tady je ten svitek s kouzlem, jak jsi chtêl.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_03"); //To je skvêlé. Teë ti pomùžu s tím zametáním.
		
		NOV_Helfer = (NOV_Helfer +1);
		DIA_Babo_Windfaust_permanent = TRUE; 
		B_GivePlayerXP (XP_Feger);
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine (self,"FEGEN");
		
		B_LogEntry 	(Topic_ParlanFegen,"Babo mi nyní pomùže zamést cely novicù.");
		
	}
	else
	{
		AI_Output (other,self ,"DIA_Babo_Windfaust_15_04"); //Ne, zatím ne.
		AI_Output (self ,other,"DIA_Babo_Windfaust_03_05"); //V tom pâípadê poèkám, až se ti jej podaâí sehnat.
	};
	AI_StopProcessInfos (self);
};


//***********************************************************************
//	 Wie ist das Leben hier im Kloster?
//***********************************************************************
INSTANCE DIA_Babo_Life   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 10;
	condition   = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent   = TRUE;
	description	= "Jak jde život tady v klášteâe?";
};
FUNC INT DIA_Babo_Life_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Life_Info()
{
	AI_Output (other,self ,"DIA_Babo_Life_15_00"); //Jak jde život tady v klášteâe?
	AI_Output (self ,other,"DIA_Babo_Life_03_01"); //Nerad bych, aby to vypadalo, že si stêžuju, ale nikdy mê nenapadlo, že to tady bude tak pâísné. Když se nedržíš pravidel, èeká tê trest.
	AI_Output (self ,other,"DIA_Babo_Life_03_02"); //Samozâejmê že spousta novicù chce v knihovnê studovat Innosovu moudrost, aby byli pâipraveni pro pâípad, že by byli vybráni.
	AI_Output (self ,other,"DIA_Babo_Life_03_03"); //Já si ale myslím, že nejlepší pâípravou ke zkoušce magie je plnit zadané úkoly.
	
	if (Npc_KnowsInfo (other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output (other,self ,"DIA_Babo_Life_15_04"); //Co je to vlastnê kolem toho vyvoleného a zkoušky?
		AI_Output (self ,other,"DIA_Babo_Life_03_05"); //Promluv si s bratrem Igarazem. Ten o tom ví hodnê.
	};
};
//*********************************************************************
//		Sc hat Babo den Gärtnerposten verschafft (Kap. 2)
//*********************************************************************
INSTANCE DIA_Babo_HowIsIt   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 1;
	condition   = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent   = TRUE;
	description	= "Jak se vede?";
};
FUNC INT DIA_Babo_HowIsIt_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Kapitel < 3)
	{
		return TRUE;
	};	
};
//--------------------
var int Babo_XPgiven;
//--------------------
FUNC VOID DIA_Babo_HowIsIt_Info()
{
	AI_Output (other,self ,"DIA_Babo_HowIsIt_15_00"); //Jak se máš?
	
	if (MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_01"); //(skromnê) Dêkuji mágùm za svùj údêl.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_02"); //Jsem rád, že mohou pracovat v zahradê, a doufám, že jsou se mnou mágové spokojeni, mistâe.
		
		if (Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP (XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_03"); //(podêšenê) D... d... dobâe, mistâe.
		AI_Output (self ,other,"DIA_Babo_HowIsIt_03_04"); //P... pracuji ze všech sil a snažím se nezklamat mágy.
	};
	
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 2
//##
//####################################################

INSTANCE DIA_Babo_Kap2_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 3
//##
//####################################################

INSTANCE DIA_Babo_Kap3_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



//******************************
// hallo!
//******************************

INSTANCE DIA_Babo_Kap3_Hello   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent   = FALSE;
	description = "Co tady dêláš?";
};
FUNC INT DIA_Babo_Kap3_Hello_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Hello_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Hello_15_00"); //Co tady dêláš?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_01"); //(rozpaèitê) Snažím se splnit úkoly, které my byly zadány, ku prospêchu kláštera.
	}	
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Hello_03_02"); //Nesmím s tebou mluvit. Na rozhovory s cizinci zde není nahlíženo s pochopením.
	}; 
};

//*********************************************
//	Kopf hoch!
//*********************************************

INSTANCE DIA_Babo_Kap3_KeepTheFaith   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent   = FALSE;
	description = "Nikdy nesmíš ztratit víru.";
};
FUNC INT DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_00"); //Nikdy nesmíš ztratit víru.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_01"); //(zaskoèen) Ne... tedy, já bych nikdy nic takového neudêlal. Vážnê!
	AI_Output (other,self ,"DIA_Babo_Kap3_KeepTheFaith_15_02"); //My všichni èasto stojíme pâed obtížnými zkouškami.
	AI_Output (self ,other,"DIA_Babo_Kap3_KeepTheFaith_03_03"); //Ano, mistâe. Budu si to vždycky pamatovat. Dêkuji ti.
	
	B_GivePlayerXP (XP_Ambient); 
};

//*********************************************
//	Das klingt aber nicht sehr glücklich.
//*********************************************

INSTANCE DIA_Babo_Kap3_Unhappy   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent   = FALSE;
	description = "To nezní zrovna dvakrát šãastnê.";
};
FUNC INT DIA_Babo_Kap3_Unhappy_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_15_00"); //To nezní zrovna dvakrát šãastnê.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_01"); //(zaskoèen) No... tedy, všechno je v naprostém poâádku, vážnê.
	AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_03_02"); //Jen... Ne, nechci si stêžovat.

	Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Tak pâestaà skuhrat.",DIA_Babo_Kap3_Unhappy_Lament); 
	Info_AddChoice	(DIA_Babo_Kap3_Unhappy,"Ale no tak, mnê to âíct mùžeš.",DIA_Babo_Kap3_Unhappy_TellMe);
};

	FUNC VOID DIA_Babo_Kap3_Unhappy_Lament ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_00"); //Tak pâestaà skuhrat.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01"); //(s obavami) Já... já... prosím, neâíkej to mágùm.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02"); //Nechci, aby mê znovu potrestali.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Lament_15_03"); //Budu o tom pâemýšlet.
		
		Info_ClearChoices	(DIA_Babo_Kap3_Unhappy);
	};
	
	FUNC VOID DIA_Babo_Kap3_Unhappy_TellMe ()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_00"); //Ale no tak, mnê to âíct mùžeš.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01"); //A vážnê to mágùm neâekneš?
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_02"); //Vypadám snad na to?
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03"); //Dobrá. Mám problém s jedním z novicù. Vyhrožuje mi.
		AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_TellMe_15_04"); //No tak už to koneènê vysyp.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05"); //Igaraz, to je ten novic, našel moje soukromé zápisky.
		AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06"); //Prý když neudêlám to, co chce, tak je pâedá mágùm.
		
		MIS_BabosDocs = LOG_RUNNING; 
		
		Log_CreateTopic (Topic_BabosDocs,LOG_MISSION);
		Log_SetTopicStatus (Topic_BabosDocs,LOG_RUNNING);
		B_LogEntry (Topic_BabosDocs,"Igaraz vydírá novice Baba kvùli nêjakým dokumentùm.");
		
		Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Myslím, že to je na mê trošku moc osobní.",DIA_Babo_Kap3_Unhappy_Privat);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Co jsi pro nêj mêl udêlat?",DIA_Babo_Kap3_Unhappy_ShouldDo);
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Co to je za dokumenty?",DIA_Babo_Kap3_Unhappy_Documents); 
		Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Možná bych ti mohl pomoct.",DIA_Babo_Kap3_Unhappy_CanHelpYou);
	};

		FUNC VOID DIA_Babo_Kap3_Unhappy_Privat ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_00"); //Myslím, že to je na mê trošku moc osobní.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01"); //Rozumím, nechceš žádné potíže. Asi si s tím budu muset poradit sám.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Privat_15_02"); //Nêjak to urèitê zvládneš.
		
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_ShouldDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00"); //Co jsi pro nêj mêl udêlat?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01"); //Nechce se mi o tom mluvit. Každopádnê by to asi Innose nepotêšilo.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02"); //Ani se mi nechce pâemýšlet nad tím, co by se stalo, kdyby to vyšlo na povrch.
		
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_Documents ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_00"); //Co to je za dokumenty?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01"); //(nejistê) Do toho nikomu nic není. Je to jen moje vêc.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_02"); //No tak, âekni mi to.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03"); //Jsou to, ehm... naprosto normální dokumenty. Nic zvláštního.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Documents_15_04"); //Dobrá, už se nebudu ptát.
		};
		
		FUNC VOID DIA_Babo_Kap3_Unhappy_CanHelpYou ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //Možná bych ti mohl pomoci.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //Udêlal bys to pro mê?
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //No, pâijde na to.
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //(kvapnê) Samozâejmê že bych ti za to zaplatil.
			AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //Kolik?
			AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //Pochopitelnê nemám moc penêz, ale mohl bych ti dát svitek s kouzlem. Je to léèivé kouzlo.
			
			Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Radši se do toho nebudu míchat.",DIA_Babo_Kap3_Unhappy_No);
			Info_AddChoice (DIA_Babo_Kap3_Unhappy,"Uvidím, co se dá dêlat.",DIA_Babo_Kap3_Unhappy_Yes);
		};

			FUNC VOID DIA_Babo_Kap3_Unhappy_No ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_No_15_00"); //Radši se do toho nebudu míchat.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_No_03_01"); //V tom pâípadê nemám na výbêr, pojedu v tom dál.
			
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};
			
			FUNC VOID DIA_Babo_Kap3_Unhappy_Yes ()
			{
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_00"); //Uvidím, co se dá dêlat.
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01"); //(šãastnê) Vážnê, urèitê to pùjde. Musí!
				AI_Output (self ,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02"); //Takže je vlastnê zapotâebí jenom zjistit, kde ty vêci Igaraz má. Pak už mu je nêjak sebereš a všechno bude v poâádku.
				AI_Output (other,self ,"DIA_Babo_Kap3_Unhappy_Yes_15_03"); //Uklidni se. Klidnê pracuj dál. O zbytek se postarám sám.
				
				Info_ClearChoices (DIA_Babo_Kap3_Unhappy);
			};

//********************************
//Ich hab deine Dokumente
//********************************

INSTANCE DIA_Babo_Kap3_HaveYourDocs   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 31;
	condition   = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent   = FALSE;
	description = "Mám ty tvoje dokumenty.";
};
FUNC INT DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if ((MIS_BabosDocs == LOG_RUNNING				)
	&&   (Npc_HasItems (other,ItWr_BabosDocs_MIS) 	>= 1)
	||  ((Npc_HasItems (other,ItWr_BabosPinUp_MIS) 	>= 1)
	&&   (Npc_HasItems (other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_00"); //Mám ty tvoje dokumenty.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_01"); //Vážnê? Díky, zachránil jsi mê. Ani nevím, jak bych se ti odvdêèil.
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_15_02"); //Jasnê, jasnê, už se uklidni.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_03_03"); //(nervóznê) Jsou vážnê moje? Jsi si jistý? Ukaž mi je.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Ještê si je chvíli ponechám.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);
	
	if (BaboSDocsOpen == TRUE)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Odvozeno od holých faktù - cena vzrostla.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};
	
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Tady to máš.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00"); //Ještê si je chvíli ponechám.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01"); //(ohromenê) Cože!? Co to má znamenat? Co chceš dêlat?
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Dêlám si srandu.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"To je èistê moje vêc.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
	
	if (Igaraz_IsPartner == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Igaraz a já jsme partneâi.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00"); //Dêlám si srandu.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01"); //(kousavê) Ha, ha, smêju se, až se za bâicho popadám. Tak kde jsou?
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02"); //Tady.
		
		if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
		{
			B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
		}
		else
		{
			B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
			B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
		};
		
		B_UseFakeScroll ();
		
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03"); //Nechtêl jsem tê urazit, ale jsem z toho všeho prostê strašnê nervózní.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04"); //To je v poâádku. Tak si ty svoje DOKUMENTY užij.
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs);
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00"); //To je èistê moje vêc.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01"); //Ty dokumenty jsou moje. Nemáš právo si je nechávat.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02"); //Nashle.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00"); //Igaraz a já jsme teë partneâi.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01"); //(nevêâícnê) Cože? To pâece nemùžeš.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02"); //Vypadá to, že mùžu. Nechám si ty papíry a všechno zùstane jako dosud.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03"); //Urovnám tu finanèní záležitost s Igarazem.
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04"); //No, tak se hezky starej o rostlinky.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05"); //Jsi svinê. Ubohá, hrabivá svinê. Innos tê potrestá.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,Dialog_Ende,DIA_Babo_Kap3_HaveYourDocs_End);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Pozor na jazyk.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
		Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Nemáš co na práci?",DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
	};
	
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_End ()
		{
			AI_StopProcessInfos (self);
		};
		
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00"); //Pozor na jazyk.
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01"); //Jsem moc mêkký, jako obvykle.
			
			AI_StopProcessInfos (self); 
		};
						
		FUNC VOID DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo ()
		{
			AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00"); //Nemáš co na práci?
			AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01"); //Já ti rozumím, ale mùžeš mi vêâit - to ještê bude mít dohru.
			
			AI_StopProcessInfos (self); 
		};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00"); //Odvozeno od holých faktù - cena vzrostla.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01"); //Nejsi o nic lepší než ostatní. Co chceš?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02"); //Co máš?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03"); //Mùžu ti dát 121 zlatých, to je všechno, co mám.
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"To nebude staèit.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice (DIA_Babo_Kap3_HaveYourDocs,"Plácneme si.",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00"); //To nebude staèit.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01"); //Ale já víc penêz opravdu nemám. Kdybych nêco takového tušil dâív, nikdy bych do kláštera nevstoupil.
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};
	
	FUNC VOID DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
	{
		AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //Plácneme si.
		AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //Tady máš peníze a ten svitek.
		
		CreateInvItems (self ,ItSc_MediumHeal,1);
		CreateInvItems (self ,ItMi_Gold,121);
		B_GiveInvItems (self,other,ItSc_MediumHeal,1);
		B_GiveInvItems (self ,other,ItMi_Gold,121);
		
		MIS_BabosDocs = LOG_SUCCESS;
		B_GivePlayerXP (XP_BabosDocs); 
		
		Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
	};

FUNC VOID DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00"); //Tady to máš.
	
	if (Npc_HasItems (other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems (other,self,ItWr_BabosDocs_MIS,1);	
	}
	else
	{
		B_GiveInvItems (other,self,ItWr_BabosPinUp_MIS,1);
		B_GiveInvItems (other,self,ItWr_BabosLetter_MIS,1);
	};
	
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01"); //Jo, jsou všechny.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02"); //Koukal ses do nich?
	AI_Output (other,self ,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03"); //Záleží na tom?
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04"); //Teë, když je mám zpátky, tak vlastnê ne.
	AI_Output (self ,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05"); //Doufám, že si teë mùžu koneènê vydechnout.
	
	CreateInvItems (self ,ItSc_MediumHeal,1);
	B_GiveInvItems (self,other,ItSc_MediumHeal,1);
	
	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP (XP_BabosDocs);
	
	Info_ClearChoices (DIA_Babo_Kap3_HaveYourDocs);
};

//*********************************************
//	Bist du zufrieden?
//*********************************************

INSTANCE DIA_Babo_Kap3_Perm   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 39;
	condition   = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent   = TRUE;
	description = "Jsi spokojený s tím, co dêláš?";
};
FUNC INT DIA_Babo_Kap3_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_00"); //Jsi spokojený s tím, co dêláš?
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_01"); //(nepâíliš pâesvêdèivê) Ano, samozâejmê. Moje víra v Innosovu moudrost a moc mi dává sílu.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_02"); //(úhybnê) Nechci být nezdvoâilý, ale mám toho dnes hodnê na práci.
		AI_Output (other,self ,"DIA_Babo_Kap3_Perm_15_03"); //Jen pokraèuj.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_04"); //(s úlevou) Díky.
	}
	else
	{
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_05"); //Jo, jde to, ale musím se vrátit do práce, jinak to dneska nikdy nedodêlám.
		AI_Output (self ,other,"DIA_Babo_Kap3_Perm_03_06"); //Nechci zase makat pùlku noci, jen abych splnil, co mi bylo zadáno, a nedostal se tak do potíží.
	};
	
	AI_StopProcessInfos (self); 
};



//####################################################
//##
//##	Kapitel 4
//##
//####################################################

INSTANCE DIA_Babo_Kap4_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//####################################################
//##
//##	Kapitel 5
//##
//####################################################

INSTANCE DIA_Babo_Kap5_EXIT   (C_INFO)
{
	npc         = NOV_612_Babo;
	nr          = 999;
	condition   = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Babo_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Babo_PICKPOCKET (C_INFO)
{
	npc			= NOV_612_Babo;
	nr			= 900;
	condition	= DIA_Babo_PICKPOCKET_Condition;
	information	= DIA_Babo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Babo_PICKPOCKET_Condition()
{
	C_Beklauen (17, 25);
};
 
FUNC VOID DIA_Babo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Babo_PICKPOCKET);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_BACK 		,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Babo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};
	
func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Babo_PICKPOCKET);
};


