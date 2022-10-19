// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 999;
	condition	= DIA_Dragon_Fire_Island_Exit_Condition;
	information	= DIA_Dragon_Fire_Island_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Island_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 5;
	condition	= DIA_Dragon_Fire_Island_Hello_Condition;
	information	= DIA_Dragon_Fire_Island_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Fire_Island_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Zosta�, cz�owieku. Moje zmys�y podpowiadaj� mi, �e to ty unicestwi�e� moich najbli�szych.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Czy�by? Kogo nazywasz zab�jc�, pomiocie piekie�?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Nie wystarczy ci, �e zniszczy�e� niemal ca�e nasze potomstwo?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Masz na sumieniu mojego brata, Feomathara, i za to mi zap�acisz.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Bez obaw. Reszt� twoich pobratymc�w te� dopadn�.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrrrh. Spal� ci� na popi� i zrobi� to z prawdziw� przyjemno�ci�.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Wi�c daruj sobie t� przemow� i przejd�my od razu do rzeczy.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Daleko zaszed�e�, ma�y cz�owieczku, ale ju� nigdy nie opu�cisz tych sal.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Nast�pny ognisty smok. Zaczynam ich mie� po dziurki w nosie. Jedyne, czego teraz chc�, to przedosta� si� przez rozpadlin�, kt�r� wida� za smokiem."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

