// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Hey, was ist da unten passiert?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //Ich habe Franco umgehauen.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //So? Dann ist es jetzt DEINE Aufgabe, dafür zu sorgen, dass die faulen Säcke jeden Tag ihre Arbeit machen.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hey, ich bin nicht hier, um mich mit Jägern rumzuärgern. Ich will in's Lager.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Nichts da. Du hast Franco umgehauen - du bist jetzt der Anführer. Also mach deinen Job.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Wenn ich der Anführer bin, dann kann ich bestimmen, wer als Nächstes reinkommt.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //Und ich bestimme, dass ICH als Nächster reinkomme.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(lacht) Ganz so einfach ist es nicht. Wir haben NIEMANDEN angefordert, also kommt auch NIEMAND rein.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus kann doch einen neuen Anführer für die Jäger schicken, dann wird drinnen ein Platz für mich frei.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(lacht) Du gibst nicht auf, was? Okay, dann schieb deinen Hintern rein.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus wird sich darum kümmern, dass die Jäger nicht ohne Anführer leben müssen.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Worauf wartest du noch? Und besorg dir 'ne Spitzhacke!
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hey, was willst du? Kann mir nicht vorstellen, dass du 'ne Erlaubnis für's Lager hast.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Franco schickt mich. Er will wissen, ob jemand im Lager gebraucht wird.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Ja, wir brauchen jemanden. Gestern hat wieder einer von den Kerlen den Löffel abgegeben.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Dieser Idiot hat sich mit Esteban angelegt.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Wer ist Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //Der Anführer des unteren Lagers. Er entscheidet, wer in die Mine kommt.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Also sag Franco, dass Thorus nach einem neuen Mann verlangt. Alles klar?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus fordert einen neuen Mann für's Lager an. Das wird Franco interessieren.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? DER Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus? Nie gehört...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hey, langsam! Du kommst nicht rein - also verschwinde!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus? DER Thorus?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Ja. DER Thorus. DER Mann, der die neuen Leute anfordert.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Der Mann, der entscheidet, ob und wann ein neuer Typ aus dem Sumpf ins Lager kommt.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Du willst mir doch nicht erzählen, dass du ihn von früher kennst?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Naja, ... Ja ...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Pass auf - JEDER kennt Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Trotzdem kommst du nicht rein - und ich werde ihm NICHTS ausrichten!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus? Nie gehört ...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Oh Mann, du kennst ihn nicht? Er war Chef der Gardisten im alten Lager.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Er ist der Mann, der das Vertrauen von allen genießt.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //Er fordert die neuen Leute an und er entscheidet, ob und wann ein neuer Mann in's Lager geholt wird.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Wenn du lange genug lebst, wirst du ihn kennenlernen.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Mach noch einen Schritt und es ist dein Letzter!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Manche lernen es nie ...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Ich bin der neue Mann.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Ich bin der neue Mann.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Hey, versuch nicht, mich zu verarschen. Es entscheidet immer noch Franco, wer von euch in's Lager kommt.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Franco hat mich geschickt...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Franco hat mich geschickt ...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Hat er nicht. Also verschwinde, sonst brech ich dir die Knochen ...
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Und? Hast du alles im Griff?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Und? Hast du alles im Griff?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Hier ist alles in Ordnung - solange niemand rein will, der nicht rein SOLL.
	
	AI_StopProcessInfos (self);
};


