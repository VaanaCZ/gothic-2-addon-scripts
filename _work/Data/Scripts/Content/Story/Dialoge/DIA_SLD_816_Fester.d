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
	description = "Was machst du hier?";
};                       

FUNC INT DIA_Fester_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Fester_Hello_Info()
{	
	AI_Output (other, self, "DIA_Fester_Hello_15_00"); //Was machst du hier?
	AI_Output (self, other, "DIA_Fester_Hello_08_01"); //Ich bereite mich auf den Kampf vor ...
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
	description = "Wieso?";
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
	AI_Output (other, self, "DIA_Fester_Auftrag_15_00"); //Wieso?
	AI_Output (self, other, "DIA_Fester_Auftrag_08_01"); //In letzter Zeit haben die Bauern immer mehr Probleme mit den Feldräubern.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_02"); //Ein paar von ihnen haben sich sogar fressen lassen.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_03"); //Das fand der dicke Onar nicht gerade lustig. Wir haben alle eine Woche lang keinen Sold bekommen.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_04"); //Und es war mehr oder weniger meine Schuld. Jetzt will Lee, dass ich das Nest der Viecher alleine platt mache.
	AI_Output (self, other, "DIA_Fester_Auftrag_08_05"); //Und die anderen Jungs haben schon Wetten abgeschlossen, ob ich's überlebe ...
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
	description = "Verstehst du was vom Kämpfen?";
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
	AI_Output (other, self, "DIA_Fester_YouFight_15_00"); //Verstehst du was vom Kämpfen?
	AI_Output (self, other, "DIA_Fester_YouFight_08_01"); //Mit dem Schwert bin ich ganz okay, aber mit dem Bogen bin ich richtig gut! Warum fragst du?
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
	description = "Wo ist das Nest?";
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
	AI_Output (other, self, "DIA_Fester_WoNest_15_00"); //Wo ist das Nest?
	AI_Output (self, other, "DIA_Fester_WoNest_08_01"); //Mitten auf dem Feld hier, in dem großen Felsen.
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
	description = "Wir könnten das Nest gemeinsam angreifen ...";
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
	AI_Output (other, self, "DIA_Fester_Together_15_00"); //Wir könnten das Nest gemeinsam angreifen ...
	AI_Output (self, other, "DIA_Fester_Together_08_01"); //Du willst mir helfen? Warum?
	
	Info_ClearChoices (DIA_Fester_Together);
	Info_AddChoice (DIA_Fester_Together, "Ich will Gold sehen!", DIA_Fester_Together_Gold);
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Fester_Together, "Ich will bei euch mitmachen!", DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output (other, self, "DIA_Fester_Together_Join_15_00"); //Ich will bei euch mitmachen!
	AI_Output (self, other, "DIA_Fester_Together_Join_08_01"); //Ach, so sieht die Sache aus. Du willst beweisen, was du drauf hast ...
	AI_Output (self, other, "DIA_Fester_Together_Join_08_02"); //(verschmitzt) Na gut, lass uns die Viecher gemeinsam angreifen.
	Fester_Choice = FC_Join;
	Info_ClearChoices (DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
		
	AI_Output (other, self, "DIA_Fester_Together_Gold_15_00"); //Ich will Gold sehen!
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_01"); //(lacht) Du Drecksack! Du willst meine Lage ausnutzen, was?
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_02"); //Entweder ich bezahle dich, oder ich geh wahrscheinlich bei der Sache drauf.
	AI_Output (self, other, "DIA_Fester_Together_Gold_08_03"); //Na gut. Ich kann dir 50 Goldstücke zahlen - mehr hab ich nicht.
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
	description = "Lass uns das Nest angreifen!";
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
	AI_Output (other, self, "DIA_Fester_TogetherNOW_15_00"); //Lass uns das Nest angreifen!
	
	if (Wld_IsTime (20,30,06,00))
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_01"); //Im Dunkeln? Nee, nee, das machen wir besser bei Tageslicht.
	}
	else
	{
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_02"); //Jetzt gleich? Oder musst du dich vorher noch ausrüsten?
		AI_Output (self, other, "DIA_Fester_TogetherNOW_08_03"); //Du könntest noch mal zum Hof gehen ...
		
		Info_ClearChoices (DIA_Fester_TogetherNOW);
		Info_AddChoice (DIA_Fester_TogetherNOW, "Gut, warten wir noch etwas...", DIA_Fester_TogetherNOW_Later);
		Info_AddChoice (DIA_Fester_TogetherNOW, "Jetzt ist genausogut wie später.", DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_Now()
{
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Now_15_00"); //Jetzt ist genau so gut wie später.
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Now_08_01"); //Gut, dann lass mal sehen, was du drauf hast.
	
	Npc_ExchangeRoutine (self, "GUIDE");

	Fester_Losgeh_Day = B_GetDayPlus();
	
	MIS_Fester_KillBugs = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_FesterRauber,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FesterRauber,LOG_RUNNING);
	B_LogEntry (TOPIC_FesterRauber,"Ich werde zusammen mit Fester das Nest der Feldräuber angreifen.");
	
	Info_ClearChoices (DIA_Fester_TogetherNOW);
	AI_StopProcessInfos (self); 
};

func void DIA_Fester_TogetherNOW_Later()
{
		
	AI_Output (other, self, "DIA_Fester_TogetherNOW_Later_15_00"); //Gut, warten wir noch etwas ...
	AI_Output (self, other, "DIA_Fester_TogetherNOW_Later_08_01"); //Du weißt ja, wo du mich findest ...
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
		AI_Output (self, other, "DIA_Fester_InCave_08_00"); //Wo, zum Teufel, hast du dich denn rumgetrieben?
	}
	else //zeitlich passend
	{
		AI_Output (self, other, "DIA_Fester_InCave_08_01"); //Hier haben sie also die toten Bauern hingeschleppt. Widerlich.
	};

	AI_Output (self, other, "DIA_Fester_InCave_08_02"); //Die Drecksviecher dürften wohl alle platt sein.
	AI_Output (self, other, "DIA_Fester_InCave_08_03"); //Lass uns wieder zurückgehen!
	
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
	description	= "Was ist mit unserer Abmachung?";
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
	AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_00"); //Was ist mit unserer Abmachung?
	if (Festers_Giant_Bug_Killed == 0)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_01"); //Willst du mich verarschen? Du hast nichts dafür getan.
	}
	else if (Fester_Choice == FC_Join)
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_02"); //Tja, ich könnte dir schon helfen, bei uns aufgenommen zu werden, aber ich werde es nicht tun.
		AI_Output (other, self, "DIA_Fester_WasMitAbmachung_15_03"); //Und warum nicht?
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_04"); //Wenn ich allen erzähle, dass du mir geholfen hast, brummen sie mir 'ne neue Aufgabe auf.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_05"); //Du verstehst doch, dass ich darauf keine Lust habe, oder?
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_06"); //Tja, Pech gehabt, Junge. Du findest bestimmt einen anderen, der dir hilft.
	}
	else //FC_Gold
	{
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_07"); //Hey - du wolltest meine Lage ausnutzen. Jetzt hab ich dich ein bisschen ausgenutzt.
		AI_Output (self, other, "DIA_Fester_WasMitAbmachung_08_08"); //Aber sieh's mal positiv: Du hast dazugelernt. Das ist doch auch was, oder?
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
	description	= "Ich denke, du bist mal wieder reif für eine Tracht Prügel.";
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
	AI_Output (other, self, "DIA_Fester_PERMPruegel_15_00"); //Ich denke, du bist mal wieder reif für eine Tracht Prügel.
	
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
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_01"); //Ich lasse mich nicht gerne verarschen!
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_02"); //Mir kommen die Tränen.
		Fester_FightVerarscht = TRUE;
	}
	else if (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		AI_Output (other, self, "DIA_Fester_PERMPruegel_15_03"); //Es war keine gute Idee von dir, dich mit Sylvio einzulassen.
		AI_Output (self, other, "DIA_Fester_PERMPruegel_08_04"); //Du bist wohl einer von Lees Speichelleckern, was? Da bist du an den Falschen geraten!
		Fester_FightSylvio = TRUE;
	}
	else
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_05"); //Was zum Teufel willst du schon wieder von mir?
			AI_Output (other, self, "DIA_Fester_PERMPruegel_15_06"); //Ich wollte dich einfach mal wieder im Dreck liegen sehen!
		}
		else
		{
			AI_Output (self, other, "DIA_Fester_PERMPruegel_08_07"); //Du kapierst es einfach nicht, was?
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




			
			





		


		
		


		






