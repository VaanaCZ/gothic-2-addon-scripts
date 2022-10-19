///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_EXIT   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 999;
	condition   = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hallo   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent   = FALSE;
	description = "Warum stehst du hier rum?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Warum stehst du hier rum?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Ich komme aus der Burg. Sie haben mich geschickt, nach den Vermissten zu suchen und die Gegend zu erkunden.
};
///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Vermisste   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent   = FALSE;
	description = "Vermisste?";
};

FUNC INT DIA_Jergan_Vermisste_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Vermisste_Info()
{
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Vermisste?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Beim Angriff der Drachen sind einige abgehauen. Die Meisten haben es nicht geschafft - wen wundert's !?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Aber wenn es noch Überlebende gibt, werde ich sie zurückbringen.
};
///////////////////////////////////////////////////////////////////////
//	Info Burg 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Burg   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent   = FALSE;
	description = "Kannst du mir helfen, in die Burg zu kommen? ";
};

FUNC INT DIA_Jergan_Burg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Burg_Info()
{
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Kannst du mir helfen, in die Burg zu kommen?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Klar, aber du musst mir einen Gefallen tun.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Wenn du es bis in die Burg schaffst, dann sprich mit dem Paladin Oric. Sag ihm, dass es seinen Bruder oben am Pass erwischt hat.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Wenn ich in der Burg bin, soll ich Oric davon berichten, das sein Bruder oben am Pass gefallen ist.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Gegend   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent   = TRUE;
	description = "Was muss ich über diese Gegend hier wissen?";
};

FUNC INT DIA_Jergan_Gegend_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
var int Jergan_Tell;
FUNC VOID DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Was muss ich über diese Gegend hier wissen?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Wenn du überleben willst, dann geh zurück - wo auch immer du hergekommen bist.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Die Grünfelle belagern seit Wochen die Burg - und irgendwo verstecken sich auch diese Drachen.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Das ganze Minental wimmelt nur so von Orks - ganz egal, wo du hinwillst, das wird kein Spaziergang.
	Jergan_Tell = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hilfe   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent   = FALSE;
	description = "Wie komme ich in die Burg?";
};

FUNC INT DIA_Jergan_Hilfe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Burg)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Hilfe_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Wie komme ich in die Burg?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Zunächst mal kannst du den direkten Weg vergessen. Aber wenn du die Burg einmal umkreist, hast du von der Rückseite eine Chance.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Du solltest die Wege meiden und den Fluss nutzen. Am Besten, du schwimmst ein Stück flussabwärts. Von da an ist es leichter.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Hinter der Burg steht eine Orkramme. Darüber kommst du hinein - schleich dich so nahe wie möglich an die Orks ran und dann lauf.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Wenn du schnell genug bist, kannst du es schaffen.
};


//2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Mine   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent   = FALSE;
	description = "Was machst du hier?";
};

FUNC INT DIA_Jergan_Mine_Condition()
{	
	if( Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Mine_Info()
{
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Was machst du hier?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Ich bin Kundschafter. Ich ziehe durch die Gegend. Aber die ganzen Snapper haben's mir nicht einfach gemacht.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Ist 'ne gute Zeit, um sich ein paar Trophäen an Land zu ziehen - vorrausgesetzt, man versteht was davon.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Claw   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent   = FALSE;
	description = "Kannst du mir das beibringen?";
};

FUNC INT DIA_Jergan_Claw_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Claw_Info()
{
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Kannst du mir das beibringen?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Ich kann dir zeigen, wie du den Biestern die Krallen rausziehst, wenn sie tot sind.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Teach   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent   = TRUE;
	description = "(Krallen ziehen lernen)";
};
FUNC INT DIA_Jergan_Teach_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Teach_Info()
{
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Zeig mir, wie ich Krallen ziehe.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Wichtig ist, dass du die Krallen mit einem Ruck entfernst. Nicht lange rumzögern oder mit 'ner Klinge stochern.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Auf diese Weise kannst du nicht nur Snappern, sondern auch Waranen und Schattenläufern die Krallen abziehen.
	};
};
///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Diego   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent   = FALSE;
	description = "Weißt du, wo Diego steckt?";
};

FUNC INT DIA_Jergan_Diego_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo (other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Parcival_Diego)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Diego_Info()
{
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Weißt du, wo Diego steckt?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Er war bei Silvestros Schürfern dabei. Aber er hat sich abgesetzt.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Ich sah ihn mit zwei Rittern und einer Kiste, gar nicht weit von hier.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Du kannst doch von hier den alten Wachturm sehen. Geh dorthin und dann in Richtung Burg.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Rechter Hand führt ein Pfad zwischen den Felsen entlang. Dorthin sind sie gegangen.
};
///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Jergan_Leader   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Jergan_Leader_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper) 
	&& Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Leader_Info()
{
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Du hast den Rudelführer also getötet. Und - hast du der Bestie die Krallen abgezogen?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Ja.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Sind bestimmt 'ne Menge wert. Es gibt Typen, die sammeln so was.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Wenn du den richtigen Käufer findest, bekommst du einen Haufen Gold dafür.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Nein.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Solltest du machen. Die sind bestimmt eine Menge wert.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jergan_PICKPOCKET (C_INFO)
{
	npc			= VLK_4110_Jergan;
	nr			= 900;
	condition	= DIA_Jergan_PICKPOCKET_Condition;
	information	= DIA_Jergan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen (84, 110);
};
 
FUNC VOID DIA_Jergan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jergan_PICKPOCKET);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_BACK 		,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};
	
func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};














