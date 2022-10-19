// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Exit(C_INFO)
{
	
	nr			= 999;
	condition	= DIA_Dragon_Fire_Exit_Condition;
	information	= DIA_Dragon_Fire_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Exit_Info()
{	
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 

	AI_Output			(self, other, "DIA_Dragon_Fire_Exit_20_00"); //Das Auge hat seine Kraft verloren und du wirst den nächsten Tag nicht mehr erleben.

	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;


	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine (Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};	
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Hello(C_INFO)
{
	
	nr			= 1;
	condition	= DIA_Dragon_Fire_Hello_Condition;
	information	= DIA_Dragon_Fire_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};	
};

FUNC VOID DIA_Dragon_Fire_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_00"); //Ich kann es einfach nicht glauben, dass es wirklich noch Menschen gibt, die ihr Leben verwirken, nur um einen leibhaftigen Drachen zu sehen.
	if (Mis_KilledDragons == 0)
	{	
		AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_01"); //Für so ein klobiges Ungetüm sprichst du aber noch recht deutlich.
	};
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_02"); //Ich bin nicht nur gekommen, um dich zu sehen. Ich fürchte, ich hatte etwas Radikaleres im Sinn.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_03"); //Sag jetzt bloß nicht, dass du mich herausfordern willst?
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_04"); //Ha Ha Ha. Ich werde dir deinen schmalen Hals brechen.
	AI_Output			(other, self, "DIA_Dragon_Fire_Hello_15_05"); //Nicht so schnell, mein Freund. Ich trage das Auge Innos' bei mir. Du kannst dich meinem Willen nicht entziehen. Beantworte meine Fragen, oder die Qualen werden für dich unerträglich sein.
	AI_Output			(self, other, "DIA_Dragon_Fire_Hello_20_06"); //(Brüllt) Arrh. Dann stell deine lächerlichen Fragen, solange du noch kannst. Deine Macht wird nicht von Dauer sein.

};


///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_WerBistDu_Condition;
	information	 = 	DIA_Dragon_Fire_WerBistDu_Info;

	description	 = 	"Wer bist du?";
};

func int DIA_Dragon_Fire_WerBistDu_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_WerBistDu_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //Mein Name ist Feomathar und das ist auch schon alles, was du über mich erfahren wirst.
	AI_Output			(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //Wenn ich aus dem Bann des Auges entfliehen kann, wirst du in Flammen aufgehen.

};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT		(C_INFO)
{
	nr		 = 	5;
	condition	 = 	DIA_Dragon_Fire_HORT_Condition;
	information	 = 	DIA_Dragon_Fire_HORT_Info;

	description	 = 	"Wo ist dein Hort?";
};

func int DIA_Dragon_Fire_HORT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
		{
				return TRUE;
		};
};

func void DIA_Dragon_Fire_HORT_Info ()
{
	AI_Output			(other, self, "DIA_Dragon_Fire_HORT_15_00"); //Jeder Drache hat doch einen Hort, wo er seinen gesammelten Reichtum lagert. Wo ist dein Hort?
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_01"); //An einem Ort, der unerreichbar sein wird für dich, wenn ich die Fesseln des Auges erst einmal los bin.
	AI_Output			(self, other, "DIA_Dragon_Fire_HORT_20_02"); //Meinen Besitz habe ich hoch oben auf dem heißen Felsen, den ein Mensch ohne Flügel wie du nur schwer erreichen sollte.

};


//**********************************************************************************
//		B_AssignDragonTalk_Fire
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Fire (var c_NPC slf)
{
	DIA_Dragon_Fire_EXIT.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc				= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc			= Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc				= Hlp_GetInstanceID(slf);
	
	//Die Drachenfragen
	B_AssignDragonTalk_Main (slf);
		
};




