// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Lo siento. Ahora no tengo tiempo.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Tengo que entrenar.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "El cañón espera.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //El cañón espera.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "¿Qué tal va todo?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //¿Qué tal?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //No me puedo quejar. Es un poco aburrido, pero al menos no tengo que trabajar.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Me estoy preparando para la siguiente misión que Greg me ha dado.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //¿Qué misión?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //No puedo decirlo.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //No te ofendas, pero he trabajado duro por este privilegio y no quiero volver a perderlo.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "¿Puedes enseñarme algo?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //¿Puedes enseñarme algo?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "¿Quién puede enseñarme algo aquí?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //¿Quién me puede enseñar algo por aquí?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry y Morgan lideran nuestras tropas de asalto.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Te pueden enseñar a ser mejor luchador.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Los hombres de Henry usan armas de dos manos.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan prefiere las armas de una mano, más rápidas.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //¿Quién más hay?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Ni idea, nunca me ha interesado nada más.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Pero seguro que Caimán Jack o Samuel pueden enseñarte aún un par de trucos.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "¿Puedes contarme algo sobre Francis?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //¿Puedes contarme algo sobre Francis?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Mira a tu alrededor. Los únicos que trabajan son Henry y sus chicos.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan se pasa el día en la cama o engullendo licor.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Con Greg, esa actitud es inadmisible. Si no te comportas, te pega la patada y punto final.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Dame esa armadura de bandido.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Dame esa armadura de bandido.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //No estoy tan loco. Greg me rebanará el cuello.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Dijo explícitamente que nadie se llevara la armadura a menos que él lo ordenara.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //No puedo dártela. Y menos ahora, que ya ha vuelto.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones no quiere darme la armadura sin permiso de Greg."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Tienes que darme la armadura de bandido. Órdenes de Greg.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Tienes que darme la armadura de bandido. Órdenes de Greg.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //¿De Greg? Fiuu, ya pensaba que tendría que ir yo.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //El trabajo de espía en el campamento de bandidos es casi un suicidio.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Preferiría que Greg se ensañara conmigo antes de que me mataran esos bandidos.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(irritado) La armadura.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Oh, vale, aquí tienes.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Ten cuidado. Esos bandidos no son de fiar.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"La orden de Greg ha hecho maravillas. ¡Ya tengo la armadura de bandido!"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

