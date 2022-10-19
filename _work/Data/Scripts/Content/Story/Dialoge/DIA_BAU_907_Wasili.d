// ************************************************************
// 							EXIT
// ************************************************************
INSTANCE DIA_Wasili_EXIT   (C_INFO)
{
	npc         = BAU_907_Wasili;
	nr          = 999;
	condition   = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Wasili_HALLO (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_HALLO_Condition;
	information	= DIA_Wasili_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Wasili_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Wasili_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Wasili_HALLO_01_00"); //Nie próbuj tu nawet niczego dotykaæ. W przeciwnym razie oberwiesz w ³eb, rozumiesz?
};


// ************************************************************
// 								Job
// ************************************************************
instance DIA_Wasili_Job (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_Job_Condition;
	information	= DIA_Wasili_Job_Info;
	permanent 	= FALSE;
	description	= "Na czym polega twoja praca?";
};

func int DIA_Wasili_Job_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Job_15_00"); //Na czym polega twoja praca?
	AI_Output (self, other, "DIA_Wasili_Job_01_01"); //Onar ka¿e mi nadzorowaæ jego w³asnoœæ.
	AI_Output (self, other, "DIA_Wasili_Job_01_02"); //Martwi siê, ¿e coœ mo¿e znikn¹æ. W³aœciwie, to mu siê nie dziwiê.
	AI_Output (self, other, "DIA_Wasili_Job_01_03"); //Wiêkszoœæ jego najemników to byli skazañcy z kolonii karnej.
	AI_Output (self, other, "DIA_Wasili_Job_01_04"); //Kiedy nikt nie patrzy, rozkradaj¹ wszystko, co da siê ukraœæ.
};


// ************************************************************
// 								Sammler
// ************************************************************
instance DIA_Wasili_Sammler	(C_INFO)
{
	npc			= BAU_907_Wasili;
	nr		 	= 4;
	condition	= DIA_Wasili_Sammler_Condition;
	information	= DIA_Wasili_Sammler_Info;
	permanent 	= FALSE;
	description	= "Jest tu mnóstwo ró¿nych rupieci.";
};

func int DIA_Wasili_Sammler_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Sammler_15_00"); //Jest tu mnóstwo ró¿nych rupieci.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_01"); //To prawda, zaœ wiêkszoœæ z nich to doœæ cenne rupiecie. Onar kolekcjonuje wartoœciowe przedmioty.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_02"); //Prostemu cz³owiekowi, jak ja, trudno by³oby sobie pozwoliæ na te wszystkie luksusy. Zbieram inne rzeczy.
	AI_Output (other, self, "DIA_Wasili_Sammler_15_03"); //Na przyk³ad co?
	AI_Output (self, other, "DIA_Wasili_Sammler_01_04"); //Stare monety.
	
	MIS_Wasili_BringOldCoin = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FirstOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_FirstOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_FirstOldCoin_Condition;
	information	 = 	DIA_Wasili_FirstOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam przy sobie pewn¹ star¹ monetê.";
};

var int Wasili_BringOldCoin_NoMore;
func int DIA_Wasili_FirstOldCoin_Condition ()
{
	if (MIS_Wasili_BringOldCoin == LOG_RUNNING)
	&& (WasilisOldCoinOffer == 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};
var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;
func void DIA_Wasili_FirstOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_15_00"); //Mam przy sobie pewn¹ star¹ monetê.
	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_01"); //Mmm. Poka¿ mi j¹, proszê.
	};

	B_GiveInvItems (other, self, ItMi_OldCoin,1);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_02"); //Och, tak. Niewiele móg³byœ za ni¹ kupiæ.
	};

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_03"); //Dam ci za ni¹ jedn¹ sztukê z³ota, zgodnie z nomina³em.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_04"); //Wiesz ile ci za ni¹ zap³acê. Jedna sztuka z³ota, nie wiêcej.
	};
	
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Niee, chyba j¹ jednak zachowam.", DIA_Wasili_FirstOldCoin_nein );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Trochê to ma³o, co powiesz na dwie?", DIA_Wasili_FirstOldCoin_mehr );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Umowa stoi.", DIA_Wasili_FirstOldCoin_ok );

	IF (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	B_GivePlayerXP (XP_BringOldCoin);
	FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Wasili_FirstOldCoin_ok ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ok_15_00"); //Umowa stoi.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_01"); //Wspaniale.

	if (WasilisOldCoinOffer == 2)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_02"); //Oto dwie sztuki z³ota.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_03"); //Jeœli bêdziesz mia³ takich wiêcej, przynieœ je MNIE.
		WasilisOldCoinOffer = 1;	
	};

	CreateInvItems (self, ItMi_Gold, WasilisOldCoinOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	WasilisOldCoinOffer);

	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_mehr_15_00"); //Trochê to ma³o, co powiesz na dwie?

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_01"); //Chyba ¿artujesz! Jeszcze do reszty nie zg³upia³em! Wynocha.
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems (self, other, ItMi_OldCoin,1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_02"); //Ach. Cholera. Niech bêdzie. Dwie sztuki z³ota za ka¿d¹ star¹ monetê, któr¹ do mnie przyniesiesz. To moja ostateczna oferta.
		WasilisOldCoinOffer =	2;
		Info_AddChoice	(DIA_Wasili_FirstOldCoin, "W tej sytuacji trzy to chyba niez³a oferta.", DIA_Wasili_FirstOldCoin_ZumTeufel );
	};
};

func void DIA_Wasili_FirstOldCoin_nein ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_nein_15_00"); //Niee, chyba j¹ jednak zachowam.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_nein_01_01"); //Zobaczysz, jeszcze wrócisz. Dla ciebie nie maj¹ one ¿adnej wartoœci.
	B_GiveInvItems (self, other, ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ZumTeufel_15_00"); //W tej sytuacji trzy to chyba niez³a oferta.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ZumTeufel_01_01"); //IdŸ do diab³a, obdartusie.
	AI_StopProcessInfos (self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////

instance DIA_Wasili_BringOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_BringOldCoin_Condition;
	information	 = 	DIA_Wasili_BringOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Interesuj¹ ciê jeszcze stare monety?";
};

func int DIA_Wasili_BringOldCoin_Condition ()
{
	if (WasilisOldCoinOffer > 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};

var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_BringOldCoin_15_00"); //Interesuj¹ ciê jeszcze stare monety?
	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_01"); //Jasne. Masz jakieœ?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_02"); //Jedn¹.
				B_GivePlayerXP (XP_BringOldCoin);
				B_GiveInvItems (other, self, ItMi_OldCoin,1);
				OldCoinCounter = OldCoinCounter + 1;
			}
		else
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_03"); //Kilka.
	
				B_GiveInvItems (other, self, ItMi_OldCoin,  OldCoinCount);
	
				XP_BringOldCoins = (OldCoinCount * XP_BringOldCoin);
				OldCoinCounter = (OldCoinCounter + OldCoinCount); 
	
				B_GivePlayerXP (XP_BringOldCoins);
			};

	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_04"); //Dziêki. Oto twoje pieni¹dze. Przynieœ mi wszystkie, które znajdziesz.

	OldCoinGeld	= (OldCoinCount * WasilisOldCoinOffer);

	CreateInvItems (self, ItMi_Gold, OldCoinGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OldCoinGeld);
};


// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Wasili_PERM	(C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr		 	= 900;
	condition	= DIA_Wasili_PERM_Condition;
	information	= DIA_Wasili_PERM_Info;
	permanent	= TRUE;
	description	= "Czy ktoœ próbowa³ ju¿ coœ ukraœæ?";
};

func int DIA_Wasili_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wasili_Job))
		{
				return TRUE;
		};
};

func void DIA_Wasili_perm_Info ()
{
	AI_Output (other, self, "DIA_Wasili_PERM_15_00"); //Czy ktoœ próbowa³ ju¿ coœ ukraœæ?

	if (Kapitel <= 2)
	{
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output (self, other, "DIA_Wasili_PERM_01_01"); //Oprócz ciebie, ma siê rozumieæ?
		};
		AI_Output (self, other, "DIA_Wasili_PERM_01_02"); //By³o kilku! Ale wszystkich z³apa³em!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Wasili_PERM_01_03"); //Kilka wieczorów temu jeden z najemników zakrad³ siê do domu.
		AI_Output (self, other, "DIA_Wasili_PERM_01_04"); //Mia³ na sobie czarn¹ szatê z kapturem, przez co nie mog³em dojrzeæ jego twarzy.
		AI_Output (self, other, "DIA_Wasili_PERM_01_05"); //Uda³o mi siê jednak go sp³oszyæ.
	};
	
	if (kapitel == 4)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_06"); //Nie. Ostatnimi czasy nie.
	};
	
	if (kapitel >= 5)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_07"); //Wydaje siê, ¿e czêœæ najemników chce siê oderwaæ od reszty.
		AI_Output (self, other, "DIA_Wasili_perm_01_08"); //Nie zdziwi³bym siê, gdyby Lee i jego ch³opcy pewnej nocy po prostu odeszli bez s³owa.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wasili_PICKPOCKET (C_INFO)
{
	npc			= BAU_907_Wasili;
	nr			= 900;
	condition	= DIA_Wasili_PICKPOCKET_Condition;
	information	= DIA_Wasili_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wasili_PICKPOCKET_Condition()
{
	C_Beklauen (55, 90);
};
 
FUNC VOID DIA_Wasili_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wasili_PICKPOCKET);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_BACK 		,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};
	
func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};


