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
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Czy ja ciê sk¹dœ nie znam?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To mo¿liwe. Te¿ by³em w Kolonii.
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
	description = "Jak wygl¹da sytuacja?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak wygl¹da sytuacja?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Teraz mamy powa¿ne k³opoty. Wœród nas, najemników, tworz¹ siê dwa obozy.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio i jego ludzie nie wierz¹, ¿e Lee ma dobry plan.
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
	description = "Co was tak poró¿ni³o?";
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
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Co was tak poró¿ni³o?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Wiêkszoœæ z nas pochodzi z Kolonii, tak samo jak Lee.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Jednak niektórzy z najemników do³¹czyli do nas póŸniej.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nie byli w Kolonii, ale walczyli z orkami - dalej na po³udniu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Jakimœ sposobem dowiedzieli siê, ¿e Lee szuka ludzi. Ich szefem by³ Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Uzna³ przywództwo Lee, ale teraz próbuje podburzaæ przeciwko niemu najemników, ¿eby nie realizowali jego planu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Sporo ludzi Lee uwa¿a, ¿e to ¿aden problem. Ale ja znam kolesi takich jak Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Zrobi wszystko, ¿eby zrealizowaæ swoje zamierzenia.
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
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, ¿ebyœmy czekali, a¿ paladyni w mieœcie wymr¹ z g³odu.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Planuje zabraæ nas wszystkich z wyspy. A Innos wie, ¿e nie mam nic przeciwko opuszczeniu tego miejsca.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Nie wiem, jak zamierza tego dokonaæ, ale mu ufam. Dobrze nami dowodzi.
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
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio dowiedzia³ siê, ¿e niektórzy z paladynów przenieœli siê do starej Kolonii.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Mówi, ¿e reszta paladynów nie odwa¿y siê nas tutaj zaatakowaæ i chce wykorzystaæ sytuacjê.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Pl¹drowaæ ma³e farmy, rozprawiæ siê z ma³ymi patrolami stra¿y poza miastem, z³upiæ podró¿nych - takie rzeczy.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Lee uwa¿a jednak, ¿e w naszej sytuacji by³aby to najgorsza rzecz, jak¹ moglibyœmy zrobiæ.
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
	description = "Chcê zostaæ najemnikiem!";
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
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Chcê zostaæ najemnikiem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nie jestem pewien, czy to dobry pomys³...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //W czym problem?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No có¿, muszê g³osowaæ za tob¹ albo przeciwko tobie.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A w obecnej sytuacji zag³osujê na ciebie tylko wtedy, jeœli bêdê pewien, ¿e stoisz po stronie Lee!
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
	description = "Wiêc co powinienem zrobiæ?";
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
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Wiêc co powinienem zrobiæ?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To proste. Obij paru ch³opaków Sylvia! Tym sposobem obie strony bêd¹ dok³adnie wiedzia³y, za kim siê opowiedzia³eœ.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A jeœli do tego bêdziesz siê trzyma³ zasad pojedynku, to zaskarbisz sobie szacunek pozosta³ych.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis chce przetrzepaæ skórê kilku ch³opakom Sylvia. Kiedy ta sprawa bêdzie ju¿ za³atwiona, udzieli mi swojego poparcia.");
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
	description = "Jakie s¹ regu³y pojedynku?";
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
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jakie s¹ regu³y pojedynku?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //IdŸ do Torlofa, jeœli jesteœ zainteresowany, on ci to wyjaœni.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //¯ebyœmy siê dobrze zrozumieli: nie interesuje mnie, czy bêdziesz przestrzega³ zasad, czy nie. Wa¿ne, ¿eby ci kolesie wyl¹dowali na glebie!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Nie muszê nawet trzymaæ siê zasad obowi¹zuj¹cych w czasie pojedynku...");
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
	description = "Którzy z najemników to ludzie Sylvia?";
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
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Którzy z najemników to ludzie Sylvia?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Jest szeœciu ch³opa. Po pierwsze Sylvio i jego prawa rêka Bullko.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Potem Rod, Sentenza, Fester i Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Reszta jest neutralna albo stoi po stronie Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Ludzie Sylvia - Bullko, Rod, Sentenza, Fester i Raoul - s¹ tacy sami jak on.");
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
	description = "Ilu ludzi Sylvia muszê pokonaæ?";
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
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Ilu ludzi Sylvia powinienem pokonaæ?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Je¿eli powalisz trzech z nich, poka¿esz po czyjej jesteœ stronie.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Kogo wybierzesz, to ju¿ twoja sprawa.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Ma³a rada: nie chodzi o sprawdzian twojej odwagi. Nie zadzieraj z Sylviem - zrobi z ciebie siekane kotlety.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Wystarczy, jeœli pokonam trzech spoœród ludzi Sylvia. Od tego ostatniego lepiej trzymaæ siê z daleka.");
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
	description = "Ilu ludzi Sylvia jest jeszcze na mojej liœcie?";
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
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Ilu ludzi Sylvia jest jeszcze na mojej liœcie?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Pokona³em Bullka.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //S³ysza³em. NieŸle.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod wygl¹da, jakby przytrafi³ mu siê ma³y wypadek.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza próbowa³ wydusiæ ze mnie trochê z³ota - to by³ niezbyt m¹dry pomys³.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Powali³em Sentenzê.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester chcia³ mnie zrobiæ w konia - i to by³ jego b³¹d.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dosta³ to, co mu siê nale¿a³o.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A jeœli chodzi o Raoula...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Poszed³em zobaczyæ siê z Raoulem...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //I?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Koniecznie potrzebowa³ porz¹dnego obicia pyska.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Jak dot¹d nie pokona³eœ ¿adnego z ludzi Sylvia.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dobrze - tylko tak dalej.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Spodziewam siê, ¿e sponiewierasz przynajmniej trzech z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //Wystarczy, wystarczy.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Naprawdê nakopa³eœ ka¿demu z nich, hê?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Jestem pod wra¿eniem - jeœli Lee mnie spyta, to bez wahania na ciebie zag³osujê.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis udzieli mi swojego poparcia, jeœli zechcê wst¹piæ w szeregi najemników.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
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
	description = "Jakieœ wieœci?";
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
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Jakieœ wieœci?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Teraz jesteœ jednym z nas. To dobrze.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Dokona³eœ z³ego wyboru - mog³eœ byæ jednym z nas.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Ch³opaki Sylvia dostali ostatnio niez³¹ nauczkê.
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Silvio w koñcu siê zmy³. Gdy dowiedzia³ siê o smokach, to razem z czêœci¹ swoich ch³opaków wyruszy³ do Kolonii.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Pewnie myœli, ¿e tam mo¿na siê ob³owiæ.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, jak na razie spokój. Nie mogê siê doczekaæ, ¿eby zobaczyæ, co z tego wyniknie.
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





		





