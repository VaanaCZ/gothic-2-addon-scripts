// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Raoul_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_EXIT_Condition;
	information	= DIA_Raoul_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Raoul_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Raoul_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				NoSentenza
// ************************************************************
instance DIA_Raoul_NoSentenza (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_NoSentenza_Condition;
	information	= DIA_Raoul_NoSentenza_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_NoSentenza_Condition()
{
	if (!Npc_KnowsInfo(other, DIA_Sentenza_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_NoSentenza_Info()
{	
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //Zaczekaj no, przyjacielu!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //Nie zauwa¿y³em, ¿eby Sentenza ciê przeszukiwa³.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //SENTENZA! ChodŸ no tu!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //Chwileczkê, zaraz tu bêdzie!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //To ci niemi³a niespodzianka.
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //Gdzie¿ on u diabla jest? Có¿, niewa¿ne, tym razem ci siê uda³o...
	};
	
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Raoul_Hello (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_Hello_Condition;
	information	= DIA_Raoul_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_Hello_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Hello_Info()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //Czego chcesz?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //Czego chcesz tym razem?
	};
};

// ************************************************************
// 			  				PERM (Gil_None)
// ************************************************************

var int Raoul_gesagt;
// -------------------------
instance DIA_Raoul_PERMNone (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_PERMNone_Condition;
	information	= DIA_Raoul_PERMNone_Info;
	permanent	= TRUE;
	description = "Chcia³bym obejrzeæ farmê."; 
};                       

FUNC INT DIA_Raoul_PERMNone_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_PERMNone_Info()
{	
	if (Raoul_gesagt == FALSE)
	{
		AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //Chcia³bym obejrzeæ farmê.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //Nie zagl¹daj do budynku po lewej stronie. Siedzi tam Sylvio i lepiej mu teraz nie przeszkadzaæ. Jest w nie najlepszym nastroju.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Jeœli zobaczy takiego s³abeusza, i to jeszcze nie pracuj¹cego na farmie, mo¿e chcieæ wy³adowaæ na nim swoj¹ z³oœæ.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //Baw siê dobrze!
		AI_StopProcessInfos (self);
	};
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Raoul_WannaJoin (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_WannaJoin_Condition;
	information	= DIA_Raoul_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chcê siê przy³¹czyæ do Lee."; 
};                       

FUNC INT DIA_Raoul_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //Chcê siê przy³¹czyæ do Lee.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //Jak tak dalej pójdzie, to wkrótce Lee nie bêdzie mia³ tu nic do gadania.
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //Co masz na myœli?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Ka¿e nam tu tylko siedzieæ i nic nie robiæ. Od czasu do czasu mamy tylko postraszyæ kilku wieœniaków, i tyle.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Sylvio zawsze powtarza, ¿e najlepsz¹ obron¹ jest atak, i ma do cholery racjê.
};
	
// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Raoul_AboutSylvio (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_AboutSylvio_Condition;
	information	= DIA_Raoul_AboutSylvio_Info;
	permanent	= FALSE;
	description = "Kim jest Sylvio?"; 
};                       

FUNC INT DIA_Raoul_AboutSylvio_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_AboutSylvio_Info()
{	
	AI_Output (other, self, "DIA_Raoul_AboutSylvio_15_00"); //Kim jest Sylvio?
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //To nasz nastêpny przywódca, jeœli chcesz znaæ moje zdanie. Je¿eli zamierzasz go prosiæ o to, by pozwoli³ ci siê do nas przy³¹czyæ, to lepiej o tym zapomnij!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Nawet pastuch by³by z ciebie marny.
};

// ************************************************************
// 			  				Stimme
// ************************************************************
instance DIA_Raoul_Stimme (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Stimme_Condition;
	information	= DIA_Raoul_Stimme_Info;
	permanent	= FALSE;
	description = "Chcia³bym zostaæ najemnikiem, co ty na to?"; 
};                       

FUNC INT DIA_Raoul_Stimme_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Stimme_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Chcia³bym zostaæ najemnikiem, co ty na to?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //Eee, rób sobie, co chcesz...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Raoul nie sprzeciwia siê mojemu wst¹pieniu w szeregi najemników.");
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Raoul_Duell (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Duell_Condition;
	information	= DIA_Raoul_Duell_Info;
	permanent	= TRUE;
	description = "Chyba przywalê ci w mordê..."; 
};                       

FUNC INT DIA_Raoul_Duell_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_AboutSylvio))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Duell_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //Chyba przywalê ci w mordê...
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //Co?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //W³aœnie tego ci teraz trzeba...
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //Do tej pory by³em mi³y, nieprawda¿?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

//#####################################################################

//							Mit erster Gilde

//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_PERM		(C_INFO)
{
	npc		 	= Sld_822_Raoul;
	nr		 	= 900;
	condition	= DIA_Raoul_PERM_Condition;
	information	= DIA_Raoul_PERM_Info;
	permanent	= TRUE;
	description	= "Oprócz tego, wszystko w porz¹dku?";
};

func int DIA_Raoul_PERM_Condition ()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //Oprócz tego, wszystko w porz¹dku?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //Przestañ mleæ ozorem. IdŸ i przynieœ mi skórê tego czarnego trolla.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //Próbujesz mnie podejœæ, co ? Spadaj!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //Nie zapomnia³em jeszcze coœ mi zrobi³.
		};
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_TROLL_Condition;
	information	 = 	DIA_Raoul_TROLL_Info;
	important	 = 	TRUE;

};

func int DIA_Raoul_TROLL_Condition ()
{
	if (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //Spójrzcie na niego!
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //Czego chcesz?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //A ty co? Przy³¹czy³eœ siê do bandy ¿ebraków? Na to wygl¹da.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //Nie myœl sobie, ¿e oka¿ê ci szacunek, tylko dlatego, ¿e jesteœ teraz jednym z nas.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Udajesz wielkiego maga, co?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //Powiem ci coœ, cokolwiek byœ na siebie za³o¿y³, nie ukryjesz swojego prawdziwego 'ja'.
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Dla mnie jesteœ tylko ma³ym, zawszonym obibokiem.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Muszê ju¿ iœæ.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "W czym problem?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Muszê ju¿ iœæ.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //Taak. Spadaj.
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //W czym problem?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Znam ja takich jak ty. Mocni tylko w gêbie.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Gardzê ludŸmi, którzy stroj¹ siê jak pawie, i chwal¹ siê swoimi bohaterskimi czynami.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Nie dalej ni¿ wczoraj musia³em zdzieliæ w pysk jednego z ch³opaków, bo przechwala³ siê, ¿e nawet z jedn¹ rêk¹ uwi¹zan¹ za plecami mo¿e powaliæ czarnego trolla.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //I co w tym dziwnego?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //Czy ty w ogóle wiesz, co mówisz? Jak to 'co w tym dziwnego'?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //Czyœ ty kiedyœ widzia³ czarnego trolla, m¹dralo? Nie masz nawet pojêcia, jakie to wielkie i groŸne bestie.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Podejdziesz krok za blisko, a rozszarpi¹ ciê na strzêpy.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Nie jestem zainteresowany.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Zabi³em ju¿ czarnego trolla.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Czarnego trolla? ¿aden problem.", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Sam siê o to prosisz. Powinienem ju¿ dawno daæ ci w mordê, ale mam lepszy pomys³.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Skoro taki wspania³y z ciebie wojownik, udowodnij to.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //A co ja bêdê z tego mia³?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //G³upie pytanie. Honor i szczêkê w jednym kawa³ku.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //Nie jest tego wiele, sam przyznasz.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //Mmm. Powiedzmy, ¿e jeœli przyniesiesz mi skórê czarnego trolla, obsypiê ciê z³otem. Co ty na to?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //Lepiej.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Na co wiêc czekasz?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul chce, abym przyniós³ mu skórê czarnego trolla."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //Nie jestem zainteresowany.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //Mo¿e to i lepiej dla ciebie.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Zabi³em ju¿ czarnego trolla.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //Czarnego trolla? ¯aden problem.
	B_Raoul_Blame ();
};
	
///////////////////////////////////////////////////////////////////////
//	Info TrophyFur
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TrophyFur		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TrophyFur_Condition;
	information	 = 	DIA_Raoul_TrophyFur_Info;
	permanent	 = 	TRUE;

	description	 = 	"Najpierw mi powiedz, jak œci¹gn¹æ skórê z czarnego trolla.";
};

func int DIA_Raoul_TrophyFur_Condition ()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)		
	&& (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Raoul_TrophyFur_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Najpierw mi powiedz, jak œci¹gn¹æ skórê z czarnego trolla.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //S³uchaj uwa¿nie, bo rzadko udzielam rad za darmo.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Z³ap bestiê i natnij skórê na ka¿dej z jego nóg.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //Potem mocno œci¹gnij skórê przez g³owê. To chyba nie trudne.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info TrollFell
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TROLLFELL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TROLLFELL_Condition;
	information	 = 	DIA_Raoul_TROLLFELL_Info;

	description	 = 	"Mam skórê czarnego trolla.";
};

func int DIA_Raoul_TROLLFELL_Condition ()
{
	if (Npc_HasItems (other,ItAt_TrollBlackFur))
	&& (Npc_KnowsInfo(other, DIA_Raoul_TROLL))
		{
				return TRUE;
		};
};

func void DIA_Raoul_TROLLFELL_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //Mam skórê czarnego trolla.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //To niemo¿liwe. Poka¿ mi j¹.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //Nieprawdopodobne. Co za ni¹ chcesz?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Dawaj wszystko, co masz.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //Dobra. Dam ci 500 sztuk z³ota i dorzucê trzy silne mikstury lecznicze, co ty na to?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "To za ma³o.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Zrobione.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //Sprzedane.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //Interesy z tob¹ to sama przyjemnoœæ.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //To za ma³o.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Jak uwa¿asz, skóra i tak bêdzie moja.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //Nie pozwolê, by ominê³a mnie taka okazja.
	MIS_Raoul_DoesntPayTrollFur = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FellZurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_FELLZURUECK		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_FELLZURUECK_Condition;
	information	 = 	DIA_Raoul_FELLZURUECK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Oddawaj skórê trolla.";
};

func int DIA_Raoul_FELLZURUECK_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur))
		{
				return TRUE;
		};
};

func void DIA_Raoul_FELLZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Oddawaj skórê trolla.
	AI_Output			(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //Nie.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GotTrollFurBack
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_GotTrollFurBack		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_GotTrollFurBack_Condition;
	information	 = 	DIA_Raoul_GotTrollFurBack_Info;

	description	 = 	"Nigdy wiêcej nie próbuj mnie okradaæ, zrozumiano?";
};

func int DIA_Raoul_GotTrollFurBack_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur) == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
				return TRUE;
		};
};

func void DIA_Raoul_GotTrollFurBack_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //Nigdy wiêcej nie próbuj mnie okradaæ, zrozumiano?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //W porz¹dku. Nie masz pojêcia, jakie panuj¹ tu zasady, prawda? W takim razie uspokój siê.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Raoul_KAP3_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP3_EXIT_Condition;
	information	= DIA_Raoul_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Raoul_KAP4_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP4_EXIT_Condition;
	information	= DIA_Raoul_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Raoul_KAP5_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP5_EXIT_Condition;
	information	= DIA_Raoul_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ship
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_Ship		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_Ship_Condition;
	information	 = 	DIA_Raoul_Ship_Info;

	description	 = 	"Mo¿e chcia³byœ siê st¹d wyrwaæ, zobaczyæ ocean...";
};

func int DIA_Raoul_Ship_Condition ()
{
	if (Kapitel >= 5)	
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //Mo¿e chcia³byœ siê st¹d wyrwaæ, zobaczyæ ocean...
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //Co masz na myœli? Chcesz porwaæ statek paladynów?
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //A jeœli nawet?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //Czyœ ty do koñca oszala³? Nie, dziêki, to nie dla mnie.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //Nie wiem, dlaczego mia³bym opuszczaæ Khorinis. Czy zarobiê tutaj, czy na kontynencie, to dla mnie bez ró¿nicy.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Poszukaj sobie kogo innego.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Pogadaj z Torlofem, z tego co wiem, spêdzi³ wiele czasu na morzu.
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Raoul_KAP6_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP6_EXIT_Condition;
	information	= DIA_Raoul_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Raoul_PICKPOCKET (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 900;
	condition	= DIA_Raoul_PICKPOCKET_Condition;
	information	= DIA_Raoul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Raoul_PICKPOCKET_Condition()
{
	C_Beklauen (45, 85);
};
 
FUNC VOID DIA_Raoul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Raoul_PICKPOCKET);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_BACK 		,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};
	
func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};


































	
	
	
	


























