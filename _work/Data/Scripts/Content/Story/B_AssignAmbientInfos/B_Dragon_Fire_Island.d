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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Zostań, człowieku. Moje zmysły podpowiadają mi, że to ty unicestwiłeś moich najbliższych.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Czyżby? Kogo nazywasz zabójcą, pomiocie piekieł?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Nie wystarczy ci, że zniszczyłeś niemal całe nasze potomstwo?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Masz na sumieniu mojego brata, Feomathara, i za to mi zapłacisz.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Bez obaw. Resztę twoich pobratymców też dopadnę.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrrrh. Spalę cię na popiół i zrobię to z prawdziwą przyjemnością.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Więc daruj sobie tę przemowę i przejdźmy od razu do rzeczy.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Daleko zaszedłeś, mały człowieczku, ale już nigdy nie opuścisz tych sal.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Następny ognisty smok. Zaczynam ich mieć po dziurki w nosie. Jedyne, czego teraz chcę, to przedostać się przez rozpadlinę, którą widać za smokiem."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

