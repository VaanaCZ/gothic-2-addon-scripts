///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro;
	nr          = 999;
	condition   = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 =  1;
	condition	 = 	DIA_Pedro_WELCOME_Condition;
	information	 = 	DIA_Pedro_WELCOME_Info;
	important	 = 	TRUE;
};
func int DIA_Pedro_WELCOME_Condition ()
{
	return TRUE;
};
func void DIA_Pedro_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_00"); //Vítej v Innosovì klášteøe, cizinèe.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_01"); //Jsem bratr Pedro, ponížený služebník Innose a strážce brány do svatého kláštera.
	AI_Output (self, other, "DIA_Pedro_WELCOME_09_02"); //Co potøebuješ?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Pedro_Wurst(C_INFO)
{
	npc         = NOV_600_Pedro;
	nr			= 2;
	condition	= DIA_Pedro_Wurst_Condition;
	information	= DIA_Pedro_Wurst_Info;
	permanent	= FALSE;
	description = "Tady máš klobásu, bratøe.";
};                       

FUNC INT DIA_Pedro_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Pedro_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Pedro_Wurst_15_00"); //Tady máš klobásu, bratøe.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_01"); //Je od tebe hezké, žes na mì myslel. Každý na mì vìtšinou zapomene.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_02"); //Možná bys mi mohl dát ještì jednu.
	AI_Output (other, self, "DIA_Pedro_Wurst_15_03"); //Na to zapomeò, pak bych jich nemìl dost.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_04"); //No co, jedna klobáska - toho si nikdo nevšimne. Nìco za to dostaneš - vím o místì, kde rostou ohnivé kopøivy.
	AI_Output (self, other, "DIA_Pedro_Wurst_09_05"); //Když je doneseš Neorasovi, urèitì ti dá klíè od knihovny. Co na to øíkáš?
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
	
	Info_ClearChoices (DIA_Pedro_Wurst);
	Info_AddChoice (DIA_Pedro_Wurst,"OK, tady máš další klobásu.",DIA_Pedro_Wurst_JA);
	Info_AddChoice (DIA_Pedro_Wurst,"Ne, na to zapomeò.",DIA_Pedro_Wurst_NEIN);
};
FUNC VOID DIA_Pedro_Wurst_JA()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_JA_15_00"); //Fajn, tady máš další klobásu.
	AI_Output (self, other, "DIA_Pedro_Wurst_JA_09_01"); //Tak. Nìkolik ohnivých kopøiv roste nalevo a napravo od mùstku na druhém bøehu.
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices (DIA_Pedro_Wurst);
	
};
FUNC VOID DIA_Pedro_Wurst_NEIN()
{
	AI_Output (other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //Ne, na to zapomeò.
	AI_Output (self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //Chceš dobøe vycházet s Goraxem, co? S novými novici to je vždycky stejné.
	
	Info_ClearChoices (DIA_Pedro_Wurst);
};
///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS		(C_INFO)
{
	npc			= 	NOV_600_Pedro;
	condition	= 	DIA_Pedro_EINLASS_Condition;
	information	= 	DIA_Pedro_EINLASS_Info;
	permanent	=	FALSE;
	description	= 	"Chci vstoupit do kláštera.";
};
func int DIA_Pedro_EINLASS_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Pedro_Welcome)
	{
		return TRUE;
	};
};
func void DIA_Pedro_EINLASS_Info ()
{
	AI_Output (other, self, "DIA_Pedro_EINLASS_15_00"); //Chci vstoupit do kláštera.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_01"); //Do kláštera mohou vstoupit jen služebníci Innosovi.
	AI_Output (self, other, "DIA_Pedro_EINLASS_09_02"); //Jestli se chceš pomodlit k Innosovi, mùžeš si najít nìjakou svatyni u cesty. Na modlitby tam je dostateèný klid.
};
///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_TEMPEL_Condition;
	information	 = 	DIA_Pedro_TEMPEL_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co musím udìlat, aby mì pøijali do kláštera?";
};
//-----------------------------------

//-----------------------------------
func int DIA_Pedro_TEMPEL_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV)
	{	
		return TRUE;
	};	
};
func void DIA_Pedro_TEMPEL_Info ()
{	
 	AI_Output (other, self, "DIA_Pedro_TEMPEL_15_00"); //Co musím udìlat, aby mì pøijali do kláštera?
 	
 	if (other.guild != GIL_NONE)
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_01"); //Pøístup do kláštera ti je zapovìzen - svou cestu sis již zvolil.
 	}
 	else
 	{
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_02"); //Pokud chceš vstoupit do bratrstva Innosova, musíš se nauèit a dodržovat pravidla kláštera.
		//AI_Output (self, other, "DIA_Pedro_TEMPEL_09_03"); //Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		//B_Say_Gold (self, other, Summe_Kloster);  
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //Každý novic také musí pøinést Innosovi dar.
 		AI_Output (self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //Ovci a 1000 zlatých.
 		AI_Output (other, self, "DIA_Pedro_TEMPEL_15_04"); //To je spousta zlata.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_05"); //Je to na znamení toho, že zaèínáš nový život jako Innosùv služebník. Když tì klášter pøijme, budou ti všechny tvoje pøedchozí høíchy odpuštìny.
 		AI_Output (self, other, "DIA_Pedro_TEMPEL_09_06"); //Ale rozmysli si to - jakmile se jednou staneš Innosovým služebníkem, nemùžeš to vzít zpìt.
 		SC_KnowsKlosterTribut = TRUE;
  		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Chci-li se stát novicem v Innosovì klášteøe, potøebuji ovci a velkou èástku penìz.");
 	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mám tu tuhle sošku...";
};
func int DIA_Addon_Pedro_Statuette_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Pedro_Rules))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_00"); //Mám tady tuhle sošku. Myslím, že ji tady v klášteøe postrádáte.
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_15_01"); //Mùžu teï jít dál?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_02"); //No, za tìchto vskutku výjimeèných okolností se mùžeš stát novicem hned.

		Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Novic Pedro mì pustil do kláštera, protože jsem u sebe mìl sošku, která se zdejším mágùm ztratila. Mám ji odevzdat nìkomu v klášteøe."); 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_03"); //Obávám se, že ani s tímhle krásným kamínkem tì nepustím dál.
		AI_Output (self, other, "DIA_Addon_Pedro_Statuette_09_04"); //Tvé kroky už vedou jiným smìrem. Cesta do kláštera je ti již uzavøena.
	};
};

instance DIA_Addon_Pedro_Statuette_Abgeben (C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information	 = 	DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent	 = 	FALSE;
	description	 = 	"Nemohl bych tu sošku pøedat prostì tobì?";
};
func int DIA_Addon_Pedro_Statuette_Abgeben_Condition ()
{	
	if (Npc_HasItems (other,ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo (other,DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Addon_Pedro_Statuette_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //Mùžu ti jenom pøedat tuhle sošku?
	AI_Output (self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //Samozøejmì, postarám se o ni. Dìkuji ti za obìtavost.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_ReportLostInnosStatue2Daron);
};
///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_Rules_Condition;
	information	 = 	DIA_Pedro_Rules_Info;
	permanent	 = 	FALSE;
	description	 = 	"Podle jakých pravidel žijete?";
};
func int DIA_Pedro_Rules_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Pedro_Tempel)
	{
		return TRUE;
	};
};
func void DIA_Pedro_Rules_Info ()
{
	AI_Output (other, self,"DIA_Pedro_Rules_15_00"); //Podle jakých pravidel žijete?
	AI_Output (self, other,"DIA_Pedro_Rules_09_01"); //Innos je bùh pravdy a øádu, takže NIKDY nesmíš zalhat nebo spáchat nìjaký zloèin.
	AI_Output (self, other,"DIA_Pedro_Rules_09_02"); //Pokud se prohøešíš proti svému bratru nebo ukradneš nìco z našich vìcí, zaplatíš za to.
	AI_Output (self, other,"DIA_Pedro_Rules_09_03"); //Innos je také bùh vlády a ohnì.
	AI_Output (self, other,"DIA_Pedro_Rules_09_04"); //Jakožto novic musíš prokazovat POSLUŠNOST a ÚCTU všem ohnivým mágùm.
	AI_Output (other,self ,"DIA_Pedro_Rules_15_05"); //Aha.
	AI_Output (self ,other,"DIA_Pedro_Rules_09_06"); //Dále je POVINNOSTÍ novice vykonávat v klášteøe všechny práce pro dobro našeho spoleèenství.
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Pedro_Rules_09_07"); //Pokud jsi pøipraven se tìmito pravidly øídit a máš dar pro Innose, rádi tì pøijmeme do kláštera jako novice.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	condition	 = 	DIA_Pedro_AUFNAHME_Condition;
	information	 = 	DIA_Pedro_AUFNAHME_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Chci se stát novicem.";
};
var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE)
	{
		return TRUE;
	};
};
func void B_DIA_Pedro_AUFNAHME_Choice ()
{
		Info_ClearChoices (DIA_Pedro_AUFNAHME);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Ještì si to nechám projít hlavou.",DIA_Pedro_AUFNAHME_NO);
		Info_AddChoice 	  (DIA_Pedro_AUFNAHME,"Ano, chci zasvìtit svùj život službì Innosovi.",DIA_Pedro_AUFNAHME_YES);
};
func void DIA_Pedro_AUFNAHME_Info ()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_15_00"); //Chci se stát novicem.
	
	Npc_PerceiveAll (self);
	
	if (hero.guild != GIL_NONE)
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_01"); //Svou cestu sis již zvolil. Cesta magie ti je uzavøena.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	//ADDON>
	else if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output (self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //Vážnì chceš udìlat zrovna tohle? Protože musíš vìdìt, že pak už nebude cesty zpátky.
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	//<ADDON
	else if (hero.guild == GIL_NONE )
	&& (Npc_HasItems (hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc (self,Follow_Sheep,NOFUNC,-1) 
	&& (Npc_GetDistToNpc(self, other) < 1000)
	{
		
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_03"); //Vidím, žes pøinesl požadovaný dar. Pokud opravdu chceš, mùžeš se stát novicem.
		AI_Output (self, hero, "DIA_Pedro_AUFNAHME_09_04"); //Ale pokud se tak rozhodneš, už není cesty zpìt - zvaž dobøe, zda je toto cesta, po níž toužíš!
		
		B_DIA_Pedro_AUFNAHME_Choice ();
	}
	else
	{
		AI_Output (self, other, "DIA_Pedro_AUFNAHME_09_02"); //Nepøinesl jsi požadovaný dar.
	};
};

FUNC VOID DIA_Pedro_AUFNAHME_YES()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //Ano, chci zasvìtit svùj život službì Innosovi.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //V tom pøípadì vítej, bratøe. Dám ti klíè ke klášterní bránì.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //Na dùkaz své svobodné vùle sám otevøi bránu a projdi dovnitø.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //Nyní jsi novic. Nos tento šat na znamení, že jsi teï èlenem bratrstva.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //Až budeš v klášteøe, jdi za Parlanem. Od nynìjška se bude starat o to, abys mìl, co potøebuješ.
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //Budou teï mé prohøešky odpuštìny?
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //Ještì ne. Promluv si s mistrem Parlanem. Požehná ti a oèistí tì od høíchù.
	
	CreateInvItems 		(self,ItKe_Innos_MIS,1);
	B_GiveInvItems 		(self, hero, ItKe_Innos_MIS,1); 
	
	CreateInvItems 		(other,ITAR_NOV_L,1);
	AI_EquipArmor		(other,ITAR_NOV_L);		   
	
	other.guild = GIL_NOV;
	Npc_SetTrueGuild (other, GIL_NOV);
	
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP (XP_AufnahmeNovize);
	
	//ADDON>
 	if (Npc_KnowsInfo (other, DIA_Addon_Pedro_Statuette))
 	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; //Joly: nix mehr mit Liesel
	};
	//ADDON<
	
	Wld_AssignRoomToGuild ("Kloster02",GIL_KDF);
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pedro_AUFNAHME_NO()
{
	AI_Output (other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //Ještì si to nechám projít hlavou.
	AI_Output (self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //Vra se, až budeš pøipraven.
	
	Info_ClearChoices (DIA_Pedro_AUFNAHME);
};
//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery		(C_INFO)
{
	npc			 = 	NOV_600_Pedro;
	nr			 = 	90;
	condition	 = 	DIA_Pedro_Monastery_Condition;
	information	 = 	DIA_Pedro_Monastery_Info;
	permanent	 = 	TRUE;
	description	 = 	"Povìz mi o životì v klášteøe.";
};
func int DIA_Pedro_Monastery_Condition ()
{		
	return TRUE;
};
func void DIA_Pedro_Monastery_Info ()
{
	AI_Output (other, self, "DIA_Pedro_Monastery_15_00"); //Povìz mi o životì v klášteøe.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_01"); //Žijeme v klášteøe, abychom sloužili Innosovi. My novicové vykonáváme všechny práce a kdykoliv mùžeme, studujeme posvátné knihy.
	AI_Output (self, other, "DIA_Pedro_Monastery_09_02"); //Na nás dohlížejí mágové, a ti zase zkoumají umìní magie.
}; 




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pedro_PICKPOCKET (C_INFO)
{
	npc			= NOV_600_Pedro;
	nr			= 900;
	condition	= DIA_Pedro_PICKPOCKET_Condition;
	information	= DIA_Pedro_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen (45, 60);
};
 
FUNC VOID DIA_Pedro_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pedro_PICKPOCKET);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_BACK 		,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};
	
func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pedro_PICKPOCKET);
};















