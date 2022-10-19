


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenNW_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_EXIT_Condition;
	information	= DIA_MiltenNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP3_EXIT_Condition;
	information	= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hallo!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_Hello_Condition;
	information	= DIA_MiltenNW_KAP3_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_MiltenNW_KAP3_Hello_Condition()
{
	if hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Hello_Info()
{	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_00"); //A¿ trudno w to uwierzyæ... Naprawdê jesteœ teraz paladynem?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_01"); //Jak widzisz...
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_02"); //Ho, ho! Maj¹c kogoœ takiego po swojej stronie, nie musimy siê ju¿ chyba obawiaæ armii Beliara!
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_03"); //Ktoœ, kto rozprawi³ siê ze Œni¹cym, nie bêdzie mia³ k³opotów z byle garstk¹ orków.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_04"); //Orkowie to najmniejsze z naszych zmartwieñ.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_05"); //Tak, wiem... ale dobrze ciê mieæ po naszej stronie.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_06"); //W porz¹dku.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_07"); //Co robisz w klasztorze? Czekaj, niech zgadnê. Chcesz pobieraæ nauki od Magów Ognia?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_08"); //Byæ mo¿e.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_09"); //Wiedzia³em! Najlepiej porozmawiaj z Mardukiem. To on zajmuje siê zwykle paladynami. Znajdziesz go przed kaplic¹.
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_10"); //Widzê, ¿e plotki nie k³ama³y.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_11"); //Jakie plotki?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_12"); //Te, wedle których do³¹czy³eœ do ³owców smoków.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_13"); //Có¿, chêtniej bym ciê widzia³ w stroju maga lub paladyna, ale przynajmniej walczysz po naszej stronie.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_14"); //To wszystko, co masz mi do powiedzenia?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_15"); //Oczywiœcie cieszê siê, ¿e ciê widzê. S¹dz¹c po twoim wygl¹dzie, orkowie powinni ju¿ zacz¹æ siê baæ.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_16"); //Orkowie s¹ teraz najmniejszym z naszych zmartwieñ.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_17"); //Wiem, ale mimo wszystko s¹ groŸni. A ty...
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_18"); //Ty pokona³eœ Œni¹cego. Twoja pomoc bêdzie nieoceniona.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_19"); //W porz¹dku.
	};		
};	

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************

INSTANCE DIA_MiltenNW_Monastery(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_Monastery_Condition;
	information	= DIA_MiltenNW_Monastery_Info;
	permanent	= FALSE;
	description = "Jakim cudem uda³o ci siê tak szybko dostaæ do klasztoru?";
};                       
FUNC INT DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_Monastery_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Monastery_15_00"); //Jakim cudem uda³o ci siê tak szybko dostaæ do klasztoru?
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_01"); //G³upie pytanie! Przeœlizgn¹³em siê przez prze³êcz i uda³em siê wprost do klasztoru.
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_02"); //Ominiêcie niektórych z pilnuj¹cych prze³êczy bestii nie by³o proste, ale koniec koñców, posz³o mi ³atwiej, ni¿ siê spodziewa³em.
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************

INSTANCE DIA_MiltenNW_FourFriends(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_FourFriends_Condition;
	information	= DIA_MiltenNW_FourFriends_Info;
	permanent	= FALSE;
	description = "Wiesz mo¿e, gdzie s¹ pozostali?";
};                       
FUNC INT DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_FourFriends_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_00"); //Wiesz mo¿e, gdzie s¹ pozostali?
	if (Npc_IsDead (PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_01"); //Gorn ca³kiem nieŸle zniós³ pobyt w wiêzieniu Garonda.
		
		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_02"); //Jak uda³o mu siê z niego wydostaæ?
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_03"); //Musia³em trochê ok³amaæ Garonda i w koñcu wycofa³ wszystkie oskar¿enia.
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_04"); //Tylko niech to bêdzie nasza tajemnica, jasne?
		};
		
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_05"); //W ka¿dym razie - zamierza³ zajrzeæ do Lee i dowiedzieæ siê, co s³ychaæ na farmie.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_06"); //Jak go znam, odbija sobie teraz z nawi¹zk¹ d³ugie dni postu w wiêzieniu. Za³o¿ê siê, ¿e nieŸle ju¿ spustoszy³ spi¿arniê najemników.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_07"); //Gornowi niestety siê nie uda³o.
	};
	if (Npc_IsDead (PC_THIEF_NW) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_08"); //Diego mamrota³ coœ o wyrównaniu rachunków, ale nie wiem, o co mu chodzi³o.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_09"); //Podejrzewam, ¿e wróci³ do miasta. Znasz go przecie¿ - zawsze szuka okazji do zarobku.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_10"); //Diego nie mia³ tyle szczêœcia. Pozosta³ wiêŸniem Bariery.
	};
};
//*************************************************************
//Ich muss ins Kloster //HauptStory!!!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 32;
	condition	= DIA_MiltenNW_KAP3_Entry_Condition;
	information	= DIA_MiltenNW_KAP3_Entry_Info;
	permanent	= TRUE;
	description = "Muszê siê dostaæ do klasztoru. To bardzo pilne!";
};                       
FUNC INT DIA_MiltenNW_KAP3_Entry_Condition()
{
	if (Kapitel == 3)	
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_Entry_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_15_00"); //Muszê siê dostaæ do klasztoru. To bardzo pilne!
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_MiltenNW_KAP3_Entry_03_01"); //W porz¹dku. Masz tu klucz.
		
		CreateInvItems (self,ItKe_Innos_Mis,1);
		B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_02"); //Nie mogê ciê wpuœciæ do klasztoru! Narazi³bym siê Najwy¿szej Radzie.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_03"); //Bez upowa¿nienia moich zwierzchników nie mogê ciê wpuœciæ do klasztoru.
	
		Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,DIALOG_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"To bardzo wa¿ne!",DIA_MiltenNW_KAP3_Entry_Important);
	
		if (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS) >=1)
		{	
			Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Mam tu list od Lorda Hagena.",DIA_MiltenNW_KAP3_Entry_Permit); 
		};
	};	
};	
	
FUNC VOID DIA_MiltenNW_KAP3_Entry_BACK ()
{
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};	

FUNC VOID DIA_MiltenNW_KAP3_Entry_Important ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Important_15_00"); //To bardzo wa¿ne!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01"); //Przykro mi. Pyrokar urwa³by mi g³owê.
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

FUNC VOID DIA_MiltenNW_KAP3_Entry_Permit ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //Mam tu list od Lorda Hagena.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //Poka¿.
	
	B_GiveInvItems (other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll ();	
	
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //No dobrze. Masz tu klucz do klasztoru. Pyrokara znajdziesz w œwi¹tyni.
	
	CreateInvItems (self,ItKe_Innos_Mis,1);
	B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	B_GiveInvItems (self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	
	MiltenNW_GivesMonasteryKey = TRUE;
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information	= DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent	= FALSE;
	description = "Wiesz mo¿e, dok¹d uciek³ Pedro?";
};                       
FUNC INT DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	IF 	(Kapitel == 3) 
	&&	(MIS_NOVIZENCHASE == LOG_RUNNING) 
	&& 	(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_NovizenChase_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_NovizenChase_15_00"); //Wiesz mo¿e, dok¹d uciek³ Pedro?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01"); //A myœlisz, ¿e sta³bym tutaj, gdybym wiedzia³, gdzie ukry³a siê ta szuja?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02"); //Zobaczysz, zap³aci za to œwiêtokradztwo! Mam tylko nadziejê, ¿e zdo³amy odzyskaæ Oko!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03"); //Musisz nam pomóc. ZnajdŸ go i odzyskaj œwiête Oko Innosa!
	//Joly: AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); //Ich werde sehen, was ich tun kann.
};	

//***************************************************************
//	Weißt du etwas über die vermummten Gestalten?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 39;
	condition	= DIA_MiltenNW_KAP3_Perm_Condition;
	information	= DIA_MiltenNW_KAP3_Perm_Info;
	permanent	= FALSE;
	description = "Mo¿esz mi coœ powiedzieæ o tych zakapturzonych postaciach?";
};                       
FUNC INT DIA_MiltenNW_KAP3_Perm_Condition()
{
	IF 	(Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Perm_15_00"); //Mo¿esz mi coœ powiedzieæ o tych zakapturzonych postaciach?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_01"); //Niestety, nie. Ale mam co do nich bardzo z³e przeczucia.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_02"); //Lepiej nie wchodŸ im w drogê.
};	
	

//########################
//##					##
//##	Kapitel 4		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP4_EXIT_Condition;
	information	= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 49;
	condition	= DIA_MiltenNW_KAP4_PERM_Condition;
	information	= DIA_MiltenNW_KAP4_PERM_Info;
	permanent	= TRUE;
	description = "Jakieœ wieœci?";
};                       
FUNC INT DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_00"); //Coœ nowego?
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_01"); //To ja powinienem o to zapytaæ. Wszyscy tutaj nadal siê niepokoj¹.
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_02"); //Najwy¿sza Rada próbuje przewidzieæ kolejny ruch nieprzyjaciela.
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_03"); //Coœ jeszcze?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_04"); //Ostatnio du¿o s³yszy siê o atakach orków, nawet poza Górnicz¹ Dolin¹.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_05"); //Nie podoba mi siê to wszystko. Bojê siê, ¿e zosta³o nam ju¿ bardzo niewiele czasu.
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_06"); //Pewien wieœniak widzia³ ko³o swojej zagrody jakieœ ³uskowate istoty.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_07"); //Nie wiem ju¿, co o tym wszystkim s¹dziæ. Wróg przygotowuje siê do kolejnego uderzenia, to pewne.
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_08"); //Docieraj¹ do nas wieœci o kolejnych opêtanych ludziach. Nieprzyjaciel roœnie w si³ê o wiele szybciej, ni¿ siê tego spodziewa³em.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_09"); //Sytuacja nadal jest bardzo powa¿na. Ca³a nadzieja w Innosie.
	};
};

//########################
//##					##
//##	Kapitel 5		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP5_EXIT_Condition;
	information	= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_MiltenNW_AllDragonsDead_Condition;
	information	= DIA_MiltenNW_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Zabi³em wszystkie smoki.";
};                       
FUNC INT DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_00"); //Zabi³em wszystkie smoki.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_01"); //Naprawdê?! A wiêc znowu zap³onê³a dla nas iskierka nadziei. Teraz musimy tylko uderzyæ w samo serce Z³a.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_02"); //Jeœli uda³o ci siê tego dokonaæ, zwyciêstwo bêdzie nasze.
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_03"); //Kto? Ja?!
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_04"); //Naturalnie! A kto inny?
	
	if (MiltenNW_IsOnBoard	 == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_05"); //Nie mamy czasu do stracenia. Ka¿da chwila jest na wagê z³ota.
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_SCWasInLib_Condition;
	information	 = 	DIA_MiltenNW_SCWasInLib_Info;
	important	 = 	TRUE;

};
func int DIA_MiltenNW_SCWasInLib_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_SCWasInLib_Info ()
{
	AI_Output			(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //Podobno spêdzi³eœ sporo czasu w klasztornych podziemiach. Dowiedzia³eœ siê czegoœ nowego?
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_MiltenNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Wiem ju¿, gdzie kryje siê nieprzyjaciel!";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //Wiem ju¿, gdzie kryje siê nieprzyjaciel! Jest ca³kiem niedaleko st¹d.
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //Zatem musimy czym prêdzej wyruszyæ w drogê. To mo¿e byæ nasza jedyna szansa!
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);  
  	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
  	if ((Npc_IsDead(DiegoNW))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //A co Diego s¹dzi na ten temat? Myœlê, ¿e chêtnie bêdzie ci towarzyszyæ.
 		B_LogEntry (TOPIC_Crew,"Diego móg³by byæ bardzo pomocny. Nigdy nie potrafi³ wytrzymaæ d³ugo w jednym miejscu.");
 	};

  	if ((Npc_IsDead(GornNW_nach_DJG))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //Co z Gornem? Podobno wróci³ z Górniczej Doliny. Koniecznie z nim porozmawiaj.
 		B_LogEntry (TOPIC_Crew,"Gorn móg³by byæ bardzo pomocny. Zawsze dobrze jest mieæ u swego boku doskona³ego wojownika. Mo¿e zgodzi siê mnie szkoliæ.");
 	};
	
	if ((Npc_IsDead(Lester))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //I nie zapomnij o Lesterze! Gdybyœ nie wyci¹gn¹³ go z tej doliny, by³oby po nim.
 		B_LogEntry (TOPIC_Crew,"Jeœli nie wezmê ze sob¹ Lestera, prawdopodobnie nigdy nie wydostanie siê z doliny.");
 	};
	
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //Ja te¿ mam pewn¹ rolê do odegrania w tej sprawie. Mogê ci pomóc w zwiêkszeniu twojej many oraz przy sporz¹dzaniu nowych run. Kiedy ruszamy?
	
	B_LogEntry (TOPIC_Crew,"Jeœli zabiorê ze sob¹ Miltena, nauczy mnie, jak tworzyæ runy i zwiêkszaæ moc magiczn¹.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_MiltenNW_KnowWhereEnemy_15_06"); //Powoli, przyjacielu. Chwilowo mam ju¿ pe³n¹ za³ogê.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //Zawsze mo¿esz na mnie liczyæ. Gdybyœ zmieni³ zdanie, wiesz, gdzie mnie szukaæ.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //Powodzenia! Niech Innos ma was w swojej opiece!
	}
	else 
	{
		Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Chwilowo mi siê nie przydasz.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Witamy na pok³adzie!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //Witamy na pok³adzie!
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //Spotykamy siê na przystani. Nie spóŸnij siê!
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //W porz¹dku. Mo¿esz na mnie liczyæ.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //Chwilowo mi siê nie przydasz.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //Wiesz, ¿e zawsze mo¿esz na mnie liczyæ. Gdybyœ zmieni³ zdanie, bêdê tutaj czeka³.

	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_WhereCaptain_Condition;
	information	 = 	DIA_MiltenNW_WhereCaptain_Info;
	
	description	 = 	"Gdzie mogê znaleŸæ kapitana statku?";

};
func int DIA_MiltenNW_WhereCaptain_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_WhereCaptain_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //Gdzie mogê znaleŸæ kapitana statku?
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //Porozmawiaj z Jorgenem, w koñcu by³ kiedyœ ¿eglarzem. Powinieneœ spotkaæ go w klasztorze.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //Gdyby on nie móg³ ci pomóc, musisz popytaæ w mieœcie, albo nawet na farmach. Z pewnoœci¹ s¹ tu jeszcze jacyœ ¿eglarze.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //Na twoim miejscu porozmawia³bym o tym z Lee albo zajrza³bym na przystañ w Khorinis. To chyba najlepsze wyjœcie.
 
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                          
	B_LogEntry (TOPIC_Captain,"Jorgen móg³by zostaæ kapitanem mojego statku. Powinienem znaleŸæ go w klasztorze. Poza tym na farmach i w mieœcie musi byæ pe³no potencjalnych kandydatów na to stanowisko. Mo¿e powinienem zapytaæ Lee albo rozejrzeæ siê w porcie.");
	
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_LeaveMyShip_Condition;
	information	 = 	DIA_MiltenNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Obawiam siê, ¿e jednak nie mo¿esz ze mn¹ pop³yn¹æ.";
};
func int DIA_MiltenNW_LeaveMyShip_Condition ()
{	
	if (MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //Obawiam siê, ¿e jednak nie mo¿esz ze mn¹ pop³yn¹æ.
	AI_Output			(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //Trudno. Wiesz najlepiej, kto ci siê przyda, a kto nie. Gdybyœ zmieni³ zdanie, znajdziesz mnie w klasztorze.
	
	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_StillNeedYou_Condition;
	information	 = 	DIA_MiltenNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potrzebujê twojej pomocy.";
};
func int DIA_MiltenNW_StillNeedYou_Condition ()
{	
	if ((MiltenNW_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //Potrzebujê twojej pomocy.

	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //Czujê siê zaszczycony. ChodŸmy wiêc! Nie mamy czasu do stracenia.
	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //Spotkamy siê wiêc na przystani.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	
		AI_StopProcessInfos (self);
};



// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenNW_Teach(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 90;
	condition	= DIA_MiltenNW_Teach_Condition;
	information	= DIA_MiltenNW_Teach_Info;
	permanent	= TRUE;
	description = "Chcê siê nauczyæ nowych zaklêæ.";
};                       

FUNC INT DIA_MiltenNW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Teach_15_00");//Chcê siê nauczyæ nowych zaklêæ.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenNW_Teach);
		Info_AddChoice (DIA_MiltenNW_Teach,DIALOG_BACK,DIA_MiltenNW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenNW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenNW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_Teach_03_01");//Nie pozna³eœ jeszcze drugiego krêgu magii! Nie mogê ciê niczego nauczyæ.
	};
};	
FUNC VOID DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenNW_Teach);
};
FUNC VOID DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_NW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenNW_Mana_Condition;
	information	 = 	DIA_MiltenNW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
};
func int DIA_MiltenNW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)	
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenNW_Mana_15_00"); //Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};
func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenNW_Mana_03_00"); //Twoja magiczna moc i tak jest ogromna. Obawiam siê, ¿e nie mogê ci pomóc.
	};
	Info_ClearChoices (DIA_MiltenNW_Mana);
};
func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
	
};
func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_Mage_NW_PICKPOCKET_Condition;
	information	= DIA_Mage_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Mage_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};
	
func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};


