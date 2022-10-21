// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Czy ja ci� sk�d� nie znam?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To mo�liwe. Te� by�em w Kolonii.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Taak... Czego chcesz?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Jak wygl�da sytuacja?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak wygl�da sytuacja?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Teraz mamy powa�ne k�opoty. W�r�d nas, najemnik�w, tworz� si� dwa obozy.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio i jego ludzie nie wierz�, �e Lee ma dobry plan.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Co was tak por�ni�o?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Co was tak por�ni�o?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Wi�kszo�� z nas pochodzi z Kolonii, tak samo jak Lee.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Jednak niekt�rzy z najemnik�w do��czyli do nas p�niej.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nie byli w Kolonii, ale walczyli z orkami - dalej na po�udniu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Jakim� sposobem dowiedzieli si�, �e Lee szuka ludzi. Ich szefem by� Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Uzna� przyw�dztwo Lee, ale teraz pr�buje podburza� przeciwko niemu najemnik�w, �eby nie realizowali jego planu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Sporo ludzi Lee uwa�a, �e to �aden problem. Ale ja znam kolesi takich jak Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Zrobi wszystko, �eby zrealizowa� swoje zamierzenia.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Czy wiesz, co zmierza Lee?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Czy wiesz, co zmierza Lee?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, �eby�my czekali, a� paladyni w mie�cie wymr� z g�odu.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Planuje zabra� nas wszystkich z wyspy. A Innos wie, �e nie mam nic przeciwko opuszczeniu tego miejsca.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Nie wiem, jak zamierza tego dokona�, ale mu ufam. Dobrze nami dowodzi.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Czy wiesz, co planuje Sylvio?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Czy wiesz, co planuje Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio dowiedzia� si�, �e niekt�rzy z paladyn�w przenie�li si� do starej Kolonii.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //M�wi, �e reszta paladyn�w nie odwa�y si� nas tutaj zaatakowa� i chce wykorzysta� sytuacj�.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Pl�drowa� ma�e farmy, rozprawi� si� z ma�ymi patrolami stra�y poza miastem, z�upi� podr�nych - takie rzeczy.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Lee uwa�a jednak, �e w naszej sytuacji by�aby to najgorsza rzecz, jak� mogliby�my zrobi�.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chc� zosta� najemnikiem!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Chc� zosta� najemnikiem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nie jestem pewien, czy to dobry pomys�...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //W czym problem?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No c�, musz� g�osowa� za tob� albo przeciwko tobie.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A w obecnej sytuacji zag�osuj� na ciebie tylko wtedy, je�li b�d� pewien, �e stoisz po stronie Lee!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Wi�c co powinienem zrobi�?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Wi�c co powinienem zrobi�?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To proste. Obij paru ch�opak�w Sylvia! Tym sposobem obie strony b�d� dok�adnie wiedzia�y, za kim si� opowiedzia�e�.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A je�li do tego b�dziesz si� trzyma� zasad pojedynku, to zaskarbisz sobie szacunek pozosta�ych.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis chce przetrzepa� sk�r� kilku ch�opakom Sylvia. Kiedy ta sprawa b�dzie ju� za�atwiona, udzieli mi swojego poparcia.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Jakie s� regu�y pojedynku?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jakie s� regu�y pojedynku?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Id� do Torlofa, je�li jeste� zainteresowany, on ci to wyja�ni.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //�eby�my si� dobrze zrozumieli: nie interesuje mnie, czy b�dziesz przestrzega� zasad, czy nie. Wa�ne, �eby ci kolesie wyl�dowali na glebie!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Nie musz� nawet trzyma� si� zasad obowi�zuj�cych w czasie pojedynku...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Kt�rzy z najemnik�w to ludzie Sylvia?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Kt�rzy z najemnik�w to ludzie Sylvia?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Jest sze�ciu ch�opa. Po pierwsze Sylvio i jego prawa r�ka Bullko.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Potem Rod, Sentenza, Fester i Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Reszta jest neutralna albo stoi po stronie Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Ludzie Sylvia - Bullko, Rod, Sentenza, Fester i Raoul - s� tacy sami jak on.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Ilu ludzi Sylvia musz� pokona�?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Ilu ludzi Sylvia powinienem pokona�?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Je�eli powalisz trzech z nich, poka�esz po czyjej jeste� stronie.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Kogo wybierzesz, to ju� twoja sprawa.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Ma�a rada: nie chodzi o sprawdzian twojej odwagi. Nie zadzieraj z Sylviem - zrobi z ciebie siekane kotlety.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Wystarczy, je�li pokonam trzech spo�r�d ludzi Sylvia. Od tego ostatniego lepiej trzyma� si� z daleka.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Ilu ludzi Sylvia jest jeszcze na mojej li�cie?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Ilu ludzi Sylvia jest jeszcze na mojej li�cie?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Pokona�em Bullka.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //S�ysza�em. Nie�le.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod wygl�da, jakby przytrafi� mu si� ma�y wypadek.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza pr�bowa� wydusi� ze mnie troch� z�ota - to by� niezbyt m�dry pomys�.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Powali�em Sentenz�.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester chcia� mnie zrobi� w konia - i to by� jego b��d.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dosta� to, co mu si� nale�a�o.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A je�li chodzi o Raoula...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Poszed�em zobaczy� si� z Raoulem...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //I?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Koniecznie potrzebowa� porz�dnego obicia pyska.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Jak dot�d nie pokona�e� �adnego z ludzi Sylvia.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dobrze - tylko tak dalej.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Spodziewam si�, �e sponiewierasz przynajmniej trzech z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //Wystarczy, wystarczy.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Naprawd� nakopa�e� ka�demu z nich, h�?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Jestem pod wra�eniem - je�li Lee mnie spyta, to bez wahania na ciebie zag�osuj�.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis udzieli mi swojego poparcia, je�li zechc� wst�pi� w szeregi najemnik�w.");
	};
};


// ###############################
// ##							##
// 			H�here Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Jakie� wie�ci?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Jakie� wie�ci?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Teraz jeste� jednym z nas. To dobrze.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Dokona�e� z�ego wyboru - mog�e� by� jednym z nas.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Ch�opaki Sylvia dostali ostatnio niez�� nauczk�.
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Silvio w ko�cu si� zmy�. Gdy dowiedzia� si� o smokach, to razem z cz�ci� swoich ch�opak�w wyruszy� do Kolonii.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Pewnie my�li, �e tam mo�na si� ob�owi�.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, jak na razie spok�j. Nie mog� si� doczeka�, �eby zobaczy�, co z tego wyniknie.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





