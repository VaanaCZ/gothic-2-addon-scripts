///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Du bist Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Du bist Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Woher kennst du meinen Namen?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Der Richter sucht nach dir. Du bist aus seinem Gefängnis geflohen.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Was hast du angestellt? Seine Brieftasche geklaut?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Nicht seine. Die des Stadthalters. Und das auch noch in seinem Auftrag.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Nachdem wir den Stadthalter überfallen haben, wollte er die Beute nicht mit uns teilen und hat uns verhaften lassen.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Wir wollten nicht am Galgen enden, also sind wir geflohen.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //Wir dachten, so würden sie uns niemals kriegen. Das war wohl ein Irrtum.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Hör auf zu jammern und zieh deine Waffe.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Was können wir gegen den Richter unternehmen?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Der Richter gab mir den Auftrag, dich zu töten.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Ich habe den Anführer der Flüchtlinge Morgahard gefunden."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Der Richter gab mir den Auftrag, dich zu töten.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Ja sicher. Deswegen bist du doch hier, oder?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Was können wir gegen den Richter unternehmen?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Gar nichts. Der sitzt wie die Spinne im Netz da oben im oberen Viertel und ist unantastbar.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Das würde ich nicht sagen. Man bräuchte nur einen Beweis seiner Schuld bei der Sache mit dem Statthalter.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Einen Beweis, sagst du? Den habe ich. Aber wer würde schon auf einen verurteilten Verbrecher hören.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Gib mir deinen Beweis, und ich werde dafür sorgen, dass dich niemand mehr jagen wird.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Bist du sicher? Na gut. Hier nimm diesen Brief. Er trägt die Unterschrift des Richters.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Auch wenn es an meiner Schuld nichts ändert, wird er doch ausreichen, seine Mittäterschaft bei der Sache zu bestätigen.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard gab mir den Auftrag des Richters. Dieses Papier beweist eindeutig, dass der Richter den Statthalter Larius hat ausrauben lassen. Ich denke, das ist genau das, was ich für Lee suchen sollte."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Hör auf zu jammern und zieh deine Waffe. Wir werden das jetzt beenden.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Wie du meinst. Ich habe sowieso nichts mehr zu verlieren.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Irgendwann werde ich dieses Richterschwein noch mal am Galgen baumeln sehen.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Warum verschwindest du nicht einfach?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


