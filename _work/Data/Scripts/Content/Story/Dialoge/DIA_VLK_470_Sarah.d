///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //¡! To jsi zase ty!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jak jdou obchody?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Jak jdou obchody?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Kdyû dorazili paladinovÈ, nejd¯Ìv jsem si myslela, ûe to je p¯Ìleûitost k dobr˝m obchod˘m.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Ale pak nechali Harada, aby jim vyr·bÏl zbranÏ, a ani Hakon ani j· jsme od nich nevidÏli ani zlatku.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //NavÌc farm·¯i uû d·l nechtÏjÌ z·sobovat mÏsto potravinami, a vöechny ceny tak jdou nahoru.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //ée mi paladinovÈ platÌ hotel, je jen slab· ˙tÏcha.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah prod·v· na trûiöti zbranÏ.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Co je s farm·¯i za problÈmy?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Co je s farm·¯i za problÈmy?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //OdmÌtajÌ dov·ûet svÈ zboûÌ.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //TeÔ, kdyû uû sem nep¯iplouvajÌ û·dnÈ lodÏ, je mÏsto samoz¯ejmÏ z·vislÈ jen na tom, co poskytnou farm·¯i.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //A Onar, ten nejvÏtöÌ z farm·¯˘, si najal ûoldnÈ¯e, aby chr·nili jeho farmu p¯ed mÏstskou str·ûÌ. Jinak by si domobrana vöechno zabrala pro sebe.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Ale ti ûold·ci nechr·nÌ jenom Onarovu farmu.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Zaöli tak daleko, ûe zastraöujÌ i malÈ farm·¯e tady u mÏsta.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //VidÏla jsem je, kdyû jsem proch·zela p¯es Akilovu farmu. NechtÏla bych teÔ b˝t v jeho k˘ûi.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde najdu Akilovu farmu?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Kde najdu Akilovu farmu?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Pokud odejdeö v˝chodnÌ br·nou a d·ö se cestou napravo, dostaneö se ke schodiöti.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //To vede nahoru k AkilovÏ farmÏ.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Ale j· bych tam teÔ nechodila - urËitÏ tam jeötÏ po¯·d jsou ûold·ci.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Ukaû mi svÈ zboûÌ.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Ukaû mi svÈ zboûÌ.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Ty! Ty m·ö tu drzost tady jeötÏ uk·zat sv˘j ksicht! Nem˘ûu to dok·zat, ale vsadÌm se, ûe jsi namoËenej do pÏknÏ öpinav˝ hry.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //Je to tvoje chyba, ûe jsem tady. Tvoje a toho zatracen˝ho Canthara - aù v·s Innos ztrest·!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar se tÏ snaûil obelstÌt...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar se tÏ pokusil podvÈst a zÌskat tv˘j st·nek pro sebe. Ale j· jsem ho p¯edhodil mÏstsk˝m str·ûÌm.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Tak to sis znep¯·telil nebezpeËnÈho muûe. Zn·m toho bastarda uû pÏknÏ dlouho a vûdycky chtÏl m˘j st·nek pro sebe.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Vezmi si tuhle zbraÚ jako vyj·d¯enÌ mÈ vdÏËnosti.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





