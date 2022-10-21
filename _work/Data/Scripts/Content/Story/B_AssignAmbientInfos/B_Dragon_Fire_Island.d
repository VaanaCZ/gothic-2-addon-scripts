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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Zostañ, cz³owieku. Moje zmys³y podpowiadaj¹ mi, ¿e to ty unicestwi³eœ moich najbli¿szych.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Czy¿by? Kogo nazywasz zabójc¹, pomiocie piekie³?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Nie wystarczy ci, ¿e zniszczy³eœ niemal ca³e nasze potomstwo?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Masz na sumieniu mojego brata, Feomathara, i za to mi zap³acisz.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Bez obaw. Resztê twoich pobratymców te¿ dopadnê.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrrrh. Spalê ciê na popió³ i zrobiê to z prawdziw¹ przyjemnoœci¹.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Wiêc daruj sobie tê przemowê i przejdŸmy od razu do rzeczy.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Daleko zaszed³eœ, ma³y cz³owieczku, ale ju¿ nigdy nie opuœcisz tych sal.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Nastêpny ognisty smok. Zaczynam ich mieæ po dziurki w nosie. Jedyne, czego teraz chcê, to przedostaæ siê przez rozpadlinê, któr¹ widaæ za smokiem."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

