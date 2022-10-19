///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"Wo führt dieser Weg hin? ";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//Wo führt dieser Weg hin?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Hinter dem Tor liegt der Pass, der zum Minental führt.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//Auf dieser Seite stehen wir - auf der anderen Seite haben sich ein paar Orks festgebissen.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Geh lieber wieder zurück - du kannst hier eh nicht durch.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Bist du sicher, dass du da rein willst? Ich befürchte, du wirst nicht sehr weit kommen - die Orks stehen auf der anderen Seite.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//Wenn es einen Weg ins Minental gibt, werde ich ihn finden.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//Gut, dann geh. Geh mit Innos.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Und wenn ich auf eigenes Risiko gehe?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//Und wenn ich auf eigenes Risiko gehe?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Dann würdest du sterben. Deshalb stehen wir ja hier. Damit du nicht auf solche dummen Gedanken kommst.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wie ist die Lage?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//Wie ist die Lage?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Alles ruhig. Wir haben die Situation im Griff.
};


