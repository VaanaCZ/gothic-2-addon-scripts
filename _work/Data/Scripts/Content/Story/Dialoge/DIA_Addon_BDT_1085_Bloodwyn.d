//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_EXIT   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 999;
	condition   = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Bloodwyn_PICKPOCKET (C_INFO)
{
	npc			= BDT_1085_Addon_Bloodwyn;
	nr			= 900;
	condition	= DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information	= DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	C_Beklauen (90, 250);
};
 
FUNC VOID DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bloodwyn_PICKPOCKET);
};
	
func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_Dead   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 2;
	condition   = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Bloodwyn_Dead_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_RAVEN_09") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_00");//Eh, ¿cómo has entrado?
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Dead_15_01");//Pues por la entrada.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Dead_04_02");//Qué gracia… ODIO los chistes.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};
//------------------------------------------------------------------------------
FUNC VOID Bloodwyn_Choices_1() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Y yo que pensaba que te había atrapado.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Todo tiene su fin.",DIA_Addon_Bloodwyn_Wait_BAD1);
};
FUNC VOID Bloodwyn_Choices_2() 
{
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"¿Y quién te crees que echó abajo la Barrera?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Tú y mucha otra gente…",DIA_Addon_Bloodwyn_Wait_BAD2);
};
FUNC VOID Bloodwyn_Choices_3() 
{
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Obviamente, no tenía tiempo para florituras…",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Sí, supongo que ese fue su mayor error.",DIA_Addon_Bloodwyn_Wait_BAD3);
};
//---------------------------------------------------------------------
//	Info Wait
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Bloodwyn_Wait   (C_INFO)
{
	npc         = BDT_1085_Addon_Bloodwyn;
	nr          = 2;
	condition   = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Bloodwyn_Wait_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MineCrawler_Killed >= 9)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_00");//¿Has matado a los reptadores de la mina? Bien. Ya me ocuparé yo ahora. Vamos, vete.
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_01");//Un segundo.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_04_02");//¿Aún sigues aquí?

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_15_03");//Aún tenemos que solucionar cierto asunto.
	
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,"Estoy buscando a Raven.",DIA_Addon_Bloodwyn_Wait_Raven);
};
FUNC VOID DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_00");//Estoy buscando a Raven.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_01");//Bien, ¿y qué te hace pensar que Raven quiere HABLAR contigo precisam… eh, un momento, eres…¿eres TÚ?
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_02");//Eres el tipo que hemos estado buscando todo este tiempo. ¿Qué HACES aquí? ¡Deberías estar muerto?
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_03");//Siempre me dicen eso.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_04");//Esos imbéciles fracasaron, pero a mí no me vencerás. ¡Esta vez acabaré contigo!
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_05");//Ya te lo he dicho: busco a Raven, tú no m interesas en absoluto.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_06");//Te mataré. ¡He sobrevivido a todos los combates!
	
	Bloodwyn_Choices_1() ;
	
}; 
FUNC VOID DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");//Basta de cháchara. Luchemos.
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");//(triunfante) ¡Ya es tarde para ti! ¡Raven está abriendo el templo! Jajajajaja, ¡muere, bastardo!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

FUNC VOID Bloodwyn_Lach()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Lach_04_00");//JAJAJA, ¡acabaré contigo igual!
};
FUNC VOID Bloodwyn_Wut()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_Wut_04_00");//¡AARGH! ¡Rata miserable!
	
	self.attribute[ATR_STRENGTH]	  = self.attribute[ATR_STRENGTH] 		-  5;
	self.attribute[ATR_HITPOINTS]	  = self.attribute[ATR_HITPOINTS] 		-  25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] 	-  25;
};
FUNC VOID Bloodwyn_Next_1()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_2_04_00");//¡Sobreviví a la explosión de la Barrera sin un rasguño!
};
FUNC VOID Bloodwyn_Next_2()
{
	AI_Output (self, other, "DIA_Addon_Bloodwyn_SayChoice_3_04_00");//¡No puedes derrotarme, soy el mejor amigo de Raven! ¡Su mano derecha!
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");//Y yo pensaba que te había vencido.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	
	Bloodwyn_Choices_2(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");//Todo tiene su fin.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	

	Bloodwyn_Choices_2(); 
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");//¿Y quién te crees que echó abajo la Barrera?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3(); 
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");//Tú y mucha más gente
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	

	Bloodwyn_Choices_3();
};
//------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Bloodwyn_Wait_GOOD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");//No suele andarse con tonterías
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

FUNC VOID DIA_Addon_Bloodwyn_Wait_BAD3()
{

	AI_Output (other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");//Sí, ese fue su mayor error
	Bloodwyn_Wut();
	Info_ClearChoices (DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice (DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};











	
	
	
	
	
	
	
	
	
	
	
		
	


