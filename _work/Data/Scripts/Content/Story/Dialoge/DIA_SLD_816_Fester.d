// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Fester_EXIT(C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 999;
	condition	= DIA_Fester_EXIT_Condition;
	information	= DIA_Fester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Fester_Hello (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 1;
	condition	= DIA_Fester_Hello_Condition;
	information	= DIA_Fester_Hello_Info;
	permanent	= FALSE;
	description = "Que faites-vous ici ?";
};                       

FUNC INT DIA_Fester_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Fester_Hello_Info()
{	
	AI_Output (other, self, "DIA_Fester_Hello_15_00"); //Que faites-vous ici ?
	AI_Output (self, other, "DIA_Fester_Hello_08_01"); //Je me prépare au combat.
};

// ************************************************************
// 			  					Auftrag 
// ************************************************************

instance DIA_Fester_Auftrag (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 2;
	condition	= DIA_Fester_Auftrag_Condition;
	information	= DIA_Fester_Auftrag_Info;
	permanent	= FALSE;
	description = "Pourquoi ?";
};                       

FUNC INT DIA_Fester_Auftrag_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_Auftrag_Info()
{	
	AI_Output (other, self, "DIA_Fester_Auftrag_15_00"); //Pourquoi ?
	AI_Output (self, other, "DIA_Fester_Auftrag_08_01"); //Depuis quelque temps, les fléaux des champs posent de plus en plus de problèmes aux fermiers.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_02"); //Quelques-uns d'entre eux se sont même fait bouffer.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_03"); //Le gros Onar n'a pas trouvé ça drôle et aucun de nous n'a été payé pendant une semaine.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_04"); //Le pire, c'est que c'était plus ou moins ma faute. Et maintenant Lee veut que je nettoie moi-même le nid de ces sales bêtes.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_05"); //Et les autres ont déjà commencé à parier sur mes chances de survie.
};

// ************************************************************
// 			  				Du Kämpfer? 
// ************************************************************

instance DIA_Fester_YouFight (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 3;
	condition	= DIA_Fester_YouFight_Condition;
	information	= DIA_Fester_YouFight_Info;
	permanent	= FALSE;
	description = "Etes-vous un bon combattant ?";
};                       

FUNC INT DIA_Fester_YouFight_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Hello))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_YouFight_Info()
{	
	AI_Output (other, self, "DIA_Fester_YouFight_15_00"); //Vous savez vous battre ?
	AI_Output (self, other, "DIA_Fester_YouFight_08_01"); //Je me débrouille à l'épée. Par contre, je suis excellent au tir à l'arc. Pourquoi cette question ?
};


// ************************************************************
// 			  				WoNest
// ************************************************************

instance DIA_Fester_WoNest (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 4;
	condition	= DIA_Fester_WoNest_Condition;
	information	= DIA_Fester_WoNest_Info;
	permanent	= FALSE;
	description = "Où est le nid ?";
};                       

FUNC INT DIA_Fester_WoNest_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_Auftrag))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_WoNest_Info()
{	
	AI_Output (other, self, "DIA_Fester_WoNest_15_00"); //Où est le nid ?
	AI_Output (self, other, "DIA_Fester_WoNest_08_01"); //Au milieu du champ, dans ce gros rocher.
};


// ************************************************************
// 			  				Du Kämpfer? 
// ************************************************************

var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;

instance DIA_Fester_Together (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 5;
	condition	= DIA_Fester_Together_Condition;
	information	= DIA_Fester_Together_Info;
	permanent	= FALSE;
	description = "Nous pourrions attaquer ce nid ensemble...";
};                       

FUNC INT DIA_Fester_Together_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Auftrag))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_Together_Info()
{	
	AI_Output (other, self, "DIA_Fester_Together_15_00"); //On pourrait l'attaquer ensemble.
	AI_Output (self, other, "DIA_Fester_Together_08_01"); //Vous voulez m'aider ? Pourquoi ?
	
	Info_ClearChoices (DIA_Fester_Together);
	Info_AddChoice (DIA_Fester_Together, "Je veux voir un peu d'or !", DIA_Fester_Together_Gold);
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Fester_Together, "Je veux me joindre à vous !", DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output (other, self, "DIA_Fester_Together_Join_15_00"); //Je veux me joindre à vous !
	AI_Output (self, other, "DIA_Fester_Together_Join_08_01"); //Ah, c'est donc ça. Vous voulez démontrer ce que vous valez.
	AI_Output (self, other, "DIA_Fester_Together_Join_08_02"); //D'accord, attaquons-les ensemble !
	Fester_Choice = FC_Join;
	Info_ClearChoices (DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
		
	AI_Output (other, self, "DIA_Fester_Together_Gold_15_00"); //Montrez-moi la couleur de votre or.
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_01"); //(éclate de rire) Espèce de fumier ! Vous cherchez à tirer profit de mes ennuis, hein ?
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_02"); //Sois je vous paie, sois je suis cuit, c'est ça ?
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_03"); //Très bien. Je peux vous offrir 50 pièces d'or. C'est tout ce que j'ai.
	Fester_Choice = FC_Gold;
	Info_ClearChoices (DIA_Fester_Together);
};

// ************************************************************
// 			  				Du Kämpfer? 
// ************************************************************
var int Fester_Losgeh_Day;
// -----------------------

instance DIA_Fester_TogetherNOW (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 6;
	condition	= DIA_Fester_TogetherNOW_Condition;
	information	= DIA_Fester_TogetherNOW_Info;
	permanent	= TRUE;
	description = "Attaquons le nid !";
};                       

FUNC INT DIA_Fester_TogetherNOW_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo (other, DIA_Fester_Together))
	&& (MIS_Fester_KillBugs == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_TogetherNOW_Info()
{	
	AI_Output (other, self, "DIA_Fester_TogetherNOW_15_00"); //Attaquons le nid !
	
	if (Wld_IsTime (20,30,06,00))
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_01"); //Dans le noir ? Non, non, il vaut mieux attendre qu'il fasse jour.
	}
	else
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_02"); //Tout de suite ? Vous n'avez pas besoin de vous équiper avant ?
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_03"); //Vous pourriez commencer par retourner à la ferme...
		
		Info_ClearChoices (DIA_Fester_TogetherNOW);
		Info_AddChoice (DIA_Fester_TogetherNOW, "Très bien, attendons un peu...", DIA_Fester_TogetherNOW_Later);
		Info_AddChoice (DIA_Fester_TogetherNOW, "Ne remettons pas au lendemain ce que nous pouvons faire le jour même.", DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_Now()
{
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Now_15_00"); //Il ne faut jamais remettre à plus tard ce qu'on peut faire le jour même.
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Now_08_01"); //Bien. Dans ce cas voyons ce que vous valez.
	
	Npc_ExchangeRoutine (self, "GUIDE");

	Fester_Losgeh_Day = B_GetDayPlus();
	
	MIS_Fester_KillBugs = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FesterRauber,LOG_RUNNING);
	B_LogEntry (TOPIC_FesterRauber,"Je vais attaquer le nid de fléaux des champs avec Fester.");
	
	Info_ClearChoices (DIA_Fester_TogetherNOW);
	AI_StopProcessInfos (self); 
};

func void DIA_Fester_TogetherNOW_Later()
{
		
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Later_15_00"); //D'accord, attendons encore un peu.
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Later_08_01"); //Vous savez où me trouver.
	Info_ClearChoices (DIA_Fester_TogetherNOW);
};
		

// ************************************************************
// 			  				InCave 
// ************************************************************

instance DIA_Fester_InCave (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 7;
	condition	= DIA_Fester_InCave_Condition;
	information	= DIA_Fester_InCave_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Fester_InCave_Condition()
{
	if (MIS_Fester_KillBugs == LOG_RUNNING)
	&& (Npc_GetDistToWP (self, "NW_BIGFARM_FELDREUBER4") <= 500)
	{
		self.aivar[AIV_LastFightComment] = TRUE; //NEWS darf nicht kommen!
		
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_InCave_Info()
{	

	if (Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output (self, other, "DIA_Fester_InCave_08_00"); //Où diable étiez-vous passé ?
	}
	else //zeitlich passend
	{
		AI_Output (self, other, "DIA_Fester_InCave_08_01"); //C'est donc là qu'ils ont traîné les fermiers morts. C'est écœurant !
	};

	AI_Output (self, other, "DIA_Fester_InCave_08_02"); //Il faut les massacrer jusqu'aux derniers, ces saletés !
	AI_Output (self, other, "DIA_Fester_InCave_08_03"); //Faisons demi-tour !
	
	Npc_ExchangeRoutine (self, "START");
	
	AI_StopProcessInfos(self);
};
	

// ************************************************************
// 			  				WasMitAbmachung? 
// ************************************************************

instance DIA_Fester_WasMitAbmachung (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 8;
	condition	= DIA_Fester_WasMitAbmachung_Condition;
	information	= DIA_Fester_WasMitAbmachung_Info;
	permanent	= FALSE;
	description	= "Et en ce qui concerne notre accord ?";
};                       

FUNC INT DIA_Fester_WasMitAbmachung_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_InCave))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_WasMitAbmachung_Info()
{	
	AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_00"); //Et notre accord ?
	if (Festers_Giant_Bug_Killed == 0)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_01"); //C'est une plaisanterie ? Vous n'avez rien fait !
	}
	else if (Fester_Choice == FC_Join)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_02"); //Je pourrais vous aider à vous faire accepter, mais je ne le ferai pas.
		AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_03"); //Pourquoi donc ?
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_04"); //Si je dis à tout le monde que vous m'avez aidé, je me retrouverai avec une nouvelle mission à accomplir.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_05"); //Vous pouvez aisément comprendre que ça ne me dit rien, non ?
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_06"); //Pas de chance pour vous, petit. Mais bon, je suis sûr que vous trouverez quelqu'un qui acceptera de vous aider.
	}
	else //FC_Gold
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_07"); //Hé ! Vous avez essayé de tirer profit de la situation dans laquelle je me trouvais, alors c'est chacun son tour !
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_08"); //Mais il faut voir le bon côté des choses : cela vous aura permis de poursuivre votre apprentissage. C'est déjà ça, non ?
	};
	
	MIS_Fester_KillBugs = LOG_OBSOLETE;
	
	//Bugs inserten, die wegen ihm raus waren
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc (Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc (Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
};


// ************************************************************
// 			  			PERMPruegel 
// ************************************************************
var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;

instance DIA_Fester_PERMPruegel (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 9;
	condition	= DIA_Fester_PERMPruegel_Condition;
	information	= DIA_Fester_PERMPruegel_Info;
	permanent	= TRUE;
	description	= "Je crois que vous méritez une autre raclée.";
};                       

FUNC INT DIA_Fester_PERMPruegel_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Fester_WasMitAbmachung)) 
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	|| (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fester_PERMPruegel_Info()
{	
	AI_Output (other, self, "DIA_Fester_PERMPruegel_15_00"); //Ah mon avis, cela vous ferait du bien que je vous tanne le cuir...
	
	if (Fester_Duell_Day < Wld_GetDay())
	{
		var int random;
		random = Hlp_Random (11);
		
		CreateInvItems (self, itmi_gold, random);
			
		Fester_Duell_Day = Wld_GetDay();
	};

	if (Npc_KnowsInfo (other, DIA_Fester_WasMitAbmachung)) 
	&& (Fester_FightVerarscht == FALSE)
	{
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_01"); //Je déteste qu'on se moque de moi.
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_02"); //Oh, là, là, je tremble de partout.
		Fester_FightVerarscht = TRUE;
	}
	else if (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_03"); //Vous n'auriez pas dû vous acoquiner avec Sylvio.
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_04"); //Vous êtes un des lèche-bottes de Lee, c'est ça ? Dans ce cas vous n'auriez jamais dû venir me trouver...
		Fester_FightSylvio = TRUE;
	}
	else
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_05"); //Qu'est-ce que vous me voulez encore ?
			AI_Output (other, self, "DIA_Fester_PERMPruegel_15_06"); //J'adore vous voir mordre la poussière !
		}
		else
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_07"); //Vous êtes lent à la détente, hein ?
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};
		

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fester_PICKPOCKET (C_INFO)
{
	npc			= Sld_816_Fester;
	nr			= 900;
	condition	= DIA_Fester_PICKPOCKET_Condition;
	information	= DIA_Fester_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fester_PICKPOCKET_Condition()
{
	C_Beklauen (27, 45);
};
 
FUNC VOID DIA_Fester_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fester_PICKPOCKET);
	Info_AddChoice		(DIA_Fester_PICKPOCKET, DIALOG_BACK 		,DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fester_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fester_PICKPOCKET);
};
	
func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fester_PICKPOCKET);
};




			
			





		


		
		


		






