// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Ni se te ocurra pedirme que me una a tu grupo de asalto.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //¿Qué crees que harán los demás hombres cuando yo me vaya, eh?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //¡Cuando vuelva, no quedará ni UNA caja llena en mi cabaña!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Me quedaré aquí a vigilar nuestros suministros.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //¿Qué tenemos aquí? Una cara nueva. Espero que no sea uno se esos sucios bandidos.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Soy Garett. Si puedo ayudarte en algo, házmelo saber.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Puedo conseguirte casi cualquier cosa. Vino, armas y todo lo que necesites.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Todo menos licor. Si quieres una buena bebida, ve a ver a Samuel.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "¿Quién es Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //¿Quién es Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //Es nuestro destilador. Tiene una cueva en la playa, un poco apartada del campamento.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //No tiene pérdida, ve hacia el norte.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Más vale que vayas bien provisto de ponche.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Algunos de nuestros hombres no se llevan muy bien con los novatos, ya me entiendes.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //¡Un buen lingotazo de ponche hará maravillas contigo!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "¿Dónde te abasteces?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //¿Dónde te abasteces?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip siempre trae muchas cosas de Khorinis cuando va para allá.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Hasta hace poco, vendía muchos de esos suministros directamente a los bandidos.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Pero desde que estamos en guerra con ellos, yo soy quién se acaba quedando todo lo que trae.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "¿Qué sabes de los bandidos?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //¿Qué sabes acerca de los bandidos?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Será mejor que eso se lo preguntes a Skip.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Ha tratado mucho con esa gente, permíteme que te diga.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg ha dado órdenes de acabar con cualquier bandido que aparezca cerca del campamento.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "¿Cómo es tu Capitán Greg?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //¿Cómo es tu Capitán Greg?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Es un viejo granuja y un tipo duro, eso seguro.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //Y avariento hasta la médula.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Ordena a Francis, nuestro tesorero, pagar la cantidad exacta para evitar que haya motines.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //Y si alguno de nosotros se hace con algo valioso DE VERDAD, inevitablemente acaba quedándoselo él.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Una vez me llevé una brújula de una fragata real.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //Ese malnacido de Greg me hizo entregarla, por supuesto.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Bah. La enterraría en algún lugar, como todos sus tesoros.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "¿Dónde puede haber enterrado la brújula?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //¿Dónde puede haber enterrado la brújula?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg me dijo una vez que la propia Muerte vigila mi brújula. Luego se rió.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //¿Algo más?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Hay una playa en la costa sur a la que sólo se puede llegar por mar.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Dicen que Greg va allí a menudo. Quizá encuentres algo.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Una vez fui a ver con qué me encontraba, pero la zona está plagada de monstruos.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Si de verdad quieres intentarlo, no olvides llevar una pica.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg le ha quitado una brújula muy valiosa a Garret, que sospecha que la ha enterrado en algún lugar de la playa sur.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Aquí tienes tu brújula.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Aquí tienes tu brújula.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(feliz) Sí, es esta. Pensé que nunca la volvería a ver.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //¡Gracias, amigo!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Esta vez Greg NO volverá a quitármela
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Toma, un cinturón a cambio. Es mi posesión más valiosa.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Me compraste este cinturón, ¿recuerdas?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Y pagaste un montón por él. (deprisa) Porque lo valía, claro. Toma, te devuelvo tu oro.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret estaba muy contento de recuperar su brújula.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "¿Qué puedes contarme sobre Francis?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //¿Qué puedes decirme sobre Francis?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg lo ha puesto al mando en su ausencia.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //¡Pero Francis es un fracaso total como líder!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Ni siquiera puede hacer que Morgan saque el culo de la cama.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry y sus hombres son los únicos que están haciendo algo.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Los otros se dedican a disfrutar de la vida, en vez de a trabajar.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Sólo espero que Greg vuelva pronto.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //Les va a dar a todos una buena patada en el trasero.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "¿Alguna novedad?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //¿Alguna novedad?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Ya no pasa nada desde que Greg se fue.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Ahora que Greg ha vuelto, parece que todo empieza a funcionar.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


