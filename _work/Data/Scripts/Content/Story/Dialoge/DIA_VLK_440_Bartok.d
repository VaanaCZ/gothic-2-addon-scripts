// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Bartok_EXIT   (C_INFO)
{
	npc         = VLK_440_Bartok;
	nr          = 999;
	condition   = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bartok_PICKPOCKET (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 900;
	condition	= DIA_Bartok_PICKPOCKET_Condition;
	information	= DIA_Bartok_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sería sencillo robar su carcaj de flechas)";
};                       

FUNC INT DIA_Bartok_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItRw_Arrow) >= 40)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bartok_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bartok_PICKPOCKET);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_BACK 		,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel(); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bartok_PICKPOCKET);
};

// *****************************************************
//						Hallo
// *****************************************************
INSTANCE DIA_Bartok_Hallo (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Hallo_Condition;
	information	= DIA_Bartok_Hallo_Info;
	permanent	= FALSE;
	description = "¿Qué pasa?";
};                       
FUNC INT DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bartok_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Hello_15_00"); //¿Qué tal va todo?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_01"); //No eres de por aquí, ¿verdad? Da igual, yo tampoco.
	AI_Output (other ,self,"DIA_Bartok_Hello_15_02"); //¿Por dónde te movías antes?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_03"); //Por los bosques, cazando carroñeros y lobos junto a otros cazadores.
	AI_Output (self ,other,"DIA_Bartok_Hello_04_04"); //Pero lo dejé. Es una época peligrosa. Hay un montón de refriegas por ahí fuera...
};
// *****************************************************
//						Jaeger
// *****************************************************
INSTANCE DIA_Bartok_Jaeger(C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 2;
	condition	= DIA_Bartok_Jaeger_Condition;
	information	= DIA_Bartok_Jaeger_Info;
	permanent	= FALSE;
	description	= "¿Dónde puedo encontrar a los otros cazadores?";
};                       
FUNC INT DIA_Bartok_Jaeger_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Jaeger_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Jager_15_00"); //¿Dónde puedo encontrar a los otros cazadores?
	AI_Output (self ,other,"DIA_Bartok_Jager_04_01"); //Teníamos nuestro campamento fuera, cerca de la taberna, a mitad de camino hacia la granja de Onar.
	AI_Output (self ,other,"DIA_Bartok_Jager_04_02"); //Pero no sé si ahora quedará alguien en el campamento.
	
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_00"); //Hasta hace unos días, quedábamos dos en la ciudad.
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_01"); //Mi amigo Trokar es un excelente cazador.
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bartok_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_440_Bartok;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bartok_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bartok_MissingPeople_Info;

	description	 = 	"¿Y dónde está tu amigo Trokar ahora?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Jaeger))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bartok_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bartok_MissingPeople_15_00"); //¿Y dónde está tu amigo Trokar ahora?
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_01"); //En fin, es una historia curiosa.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_02"); //Hace sólo unos días, estábamos en la barra de la taberna de Coragon, hablando de caza.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_03"); //No me preguntes lo que pasó luego. Ya me había tomado unas cuantas.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_04"); //Recuerdo vagamente que Trokar dijo que iba a ir a por unos cigarros de hierba del pantano. Nunca volvió.

	MIS_Bartok_MissingTrokar = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "¿No fuiste a buscarlo?", DIA_Addon_Bartok_MissingPeople_such );
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "¿Dónde puedo conseguir cigarros de hierba del pantano?", DIA_Addon_Bartok_MissingPeople_wo );
};
func void DIA_Addon_Bartok_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_wo_15_00"); //¿Dónde se consiguen cigarros de hierba del pantano?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_wo_04_01"); //En algún lugar del puerto, por lo que sé.
};
func void DIA_Addon_Bartok_MissingPeople_such ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_such_15_00"); //¿No fuiste a buscarlo?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_01"); //No, pero informé a la milicia.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_02"); //Aunque aún no han podido encontrarlo.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_03"); //Espero que no lo atacara un lobo o algo peor.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_04"); //Tengo miedo de encontrarme su cadáver cuando salga de caza.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_05"); //No podría soportarlo.
};

// *****************************************************
//						Bosper
// *****************************************************
INSTANCE DIA_Bartok_Bosper (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 3;
	condition	= DIA_Bartok_Bosper_Condition;
	information	= DIA_Bartok_Bosper_Info;
	permanent	= FALSE;
	description	= "Bosper dijo que solías trabajar para él...";
};                       
FUNC INT DIA_Bartok_Bosper_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bosper_Bartok))
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Bosper_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_00"); //Bosper dijo que solías trabajar para él...
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_01"); //Sí, es cierto. Pero solo le interesaban sus malditas pieles.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_02"); //Le dije lo peligroso que era esto. No me hizo mucho caso.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_03"); //Bueno, en cualquier caso, pagaba bien. No me puedo quejar de eso.
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_04"); //¿Puedes contarme algo más sobre él?
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_05"); //(Se ríe) A Bosper le robaron uno de sus arcos recientemente, a plena luz del día.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_06"); //Un tipo entró directamente en su tienda, cogió un arco y se largó.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_07"); //¡Los ladrones son cada vez más osados!
	
	if (MIS_Bosper_Bogen != LOG_SUCCESS) 
	{    
		MIS_Bosper_Bogen = LOG_RUNNING;
	};   
};
	
// *****************************************************
//						WannaLearn
// *****************************************************
INSTANCE DIA_Bartok_WannaLearn (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_WannaLearn_Condition;
	information	= DIA_Bartok_WannaLearn_Info;
	permanent	= FALSE;
	description	= "¿Puedes enseñarme algo del arte de cazar?";
};                       
FUNC INT DIA_Bartok_WannaLearn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_WannaLearn_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_WannaLearn_15_00"); //¿Puedes enseñarme algo del arte de cazar?
	AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_01"); //Puedo enseñarte a acercarte sigilosamente y a manejar un arco.
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_02"); //Si quieres aprender a desollar un animal, díselo a Bosper. Él es quien me enseñó.
	};
	
	Bartok_TeachPlayer = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Bartok puede enseñarme a tirar con arco y a ser sigiloso.");
};

// *****************************************************
//						TeachSneak
// *****************************************************
INSTANCE DIA_Bartok_TeachSneak (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_TeachSneak_Condition;
	information	= DIA_Bartok_TeachSneak_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString ("¡Enséñame a ser sigiloso!", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};                       
FUNC INT DIA_Bartok_TeachSneak_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_TeachSneak_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_TeachSneak_15_00"); //¡Enséñame a moverme con sigilo!
	
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_01"); //De acuerdo. Lo primero que tienes que hacer es asegurarte de equilibrar tu peso adecuadamente.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_02"); //Para conseguirlo, dobla tus rodillas y apoya siempre tu pie pisando con el talón.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_03"); //Asegúrate siempre de cargar tu peso en el pie en el que te apoyas hasta que tengas apoyado el otro pie firmemente.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_04"); //No podrás acercarte a la mayoría de las criaturas a no ser que estén dormidas. Las bestias pueden olerte.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_05"); //Así que presta siempre mucha atención cuando estés ahí fuera.
	};
};

// *****************************************************
//						TEACH
// *****************************************************
var int Bosper_MerkeBow;
// ---------------------

INSTANCE DIA_Bartok_Teach (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_Teach_Condition;
	information	= DIA_Bartok_Teach_Info;
	permanent	= TRUE;
	Description = "¡Quiero ser capaz de manejar mejor un arco!";
};                       
FUNC INT DIA_Bartok_Teach_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Bartok_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Bartok_TeachBow_15_00"); //¡Quiero ser capaz de manejar mejor un arco!
	AI_Output (self ,other,"DIA_Bartok_TeachBow_04_01"); //De acuerdo, veamos si puedo enseñarte algo...
	
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices (DIA_Bartok_Teach);
	
	Info_AddChoice		(DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};

FUNC VOID DIA_Bartok_Teach_BACK()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00"); //Ahora deberías buscar a alguien que sepa más sobre el tema que yo.
	}
	else if (Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01"); //Bien, tu puntería ya ha mejorado.
	};
	
	Info_ClearChoices (DIA_Bartok_Teach);
};

FUNC VOID DIA_Bartok_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};
FUNC VOID DIA_Bartok_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);	
};

// *****************************************************
//						Zusammen
// *****************************************************
var int Bartok_Bereit; 
var int Bartok_Later;
// ---------------------------

INSTANCE DIA_Bartok_Zusammen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_Zusammen_Condition;
	information	= DIA_Bartok_Zusammen_Info;
	permanent	= TRUE;
	description	= "¿Por qué no salimos a cazar juntos?";
};                       
FUNC INT DIA_Bartok_Zusammen_Condition()
{
	if (Bartok_Bereit == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Zusammen_Info()
{	
	if (Bartok_Later == FALSE)
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_00"); //¿Por qué no salimos a cazar juntos?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_01"); //Mmm. Yendo dos no es tan peligroso, eso es verdad...
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_02"); //Entonces, ¿sabes algo de caza?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_03"); //Quiero decir que si sabes desollar a un animal.
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (Bartok_Later == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_HuntNOW_04_01"); //¿Tienes 50 monedas de oro?
		}
		else
		{
			AI_Output (other ,self,"DIA_Bartok_Zusammen_15_04"); //Sí.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_05"); //De acuerdo, pero quiero ver las 50 monedas de oro. A cambio, puedes quedarte las pieles y vendérselas a Bosper.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_06"); //Es un trato justo, ¿no?
		};
		
		Info_ClearChoices (DIA_Bartok_Zusammen);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Más tarde...", DIA_Bartok_Zusammen_Later);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Aquí están...", DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_07"); //No.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_08"); //Entonces no merecería la pena.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_09"); //Regresa cuando hayas aprendido algo.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_Later_15_00"); //Más tarde...
	Bartok_Later = TRUE;
	Info_ClearChoices (DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices (DIA_Bartok_Zusammen);
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (other ,self,"DIA_Bartok_HuntNOW_GO_15_00"); //Aquí están...
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_03"); //¿Pues dónde? No tienes el oro.
	};
};


// *****************************************************
//						HuntNOW
// *****************************************************
var int Bartok_Los;
// ----------------------

INSTANCE DIA_Bartok_HuntNOW (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_HuntNOW_Condition;
	information	= DIA_Bartok_HuntNOW_Info;
	permanent	= FALSE;
	description	= "¡Vayamos de caza!";
};                       
FUNC INT DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_HuntNOW_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_15_00"); //¡Vayamos de caza!
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_01"); //De acuerdo, sígueme. Tras la puerta sur hay un bosque en el que deberíamos encontrar suficientes bichos.
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_02"); //(Para sí mismo) Probablemente, más de los que nos gustaría...
	Bartok_Los = TRUE;
		
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "GUIDEMITTE");
	
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02"); 
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
};

// *****************************************************
//						Im Wald
// *****************************************************
var int Bartok_OrkStillThere;
// ---------------------

INSTANCE DIA_Bartok_ImWald (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_ImWald_Condition;
	information	= DIA_Bartok_ImWald_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_ImWald_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_03") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_ImWald_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_ImWald_04_00"); //Entonces, ¿qué opinas? ¿Debemos adentrarnos más en el bosque o no?
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	Info_AddChoice	  (DIA_Bartok_ImWald, "¡Regresemos!", DIA_Bartok_ImWald_NachHause);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Vamos.", DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_NachHause_15_00"); //¡Regresemos!
	AI_Output (self ,other,"DIA_Bartok_ImWald_NachHause_04_01"); //Yo preferiría eso. Probablemente terminaríamos dándonos de morros con un orco.
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_Weiter_15_00"); //Vamos.
	AI_Output (self ,other,"DIA_Bartok_ImWald_Weiter_04_01"); //De acuerdo. (Para sí mismo) Espero que esto funcione...
	
	if (!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GUIDEENDE");
};

// *****************************************************
//						Angekommen
// *****************************************************
var int Bartok_Ende;
// -------------------

INSTANCE DIA_Bartok_Angekommen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Angekommen_Condition;
	information	= DIA_Bartok_Angekommen_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_Angekommen_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_07") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Angekommen_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_00"); //¡Eso es! Creo que voy a volver a la ciudad.
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_01"); //Aquí fuera es demasiado peligroso para mí. Incluso siendo dos.
	
	if (Bartok_OrkStillThere == TRUE)
	//&& (Npc_IsDead (CityOrc))
	{
		B_Bartok_ShitAnOrc();
		
		Bartok_OrkGesagt = TRUE;
	};
	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_03"); //Bueno, ¡hasta luego!
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_04"); //Puedes vender las pieles a Bosper.
	
	Bartok_Ende = TRUE;
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
	
};

// *****************************************************
//							PERM
// *****************************************************
INSTANCE DIA_Bartok_PERM (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_PERM_Condition;
	information	= DIA_Bartok_PERM_Info;
	permanent	= TRUE;
	description = "¿Va todo bien?";
};                       
FUNC INT DIA_Bartok_PERM_Condition()
{
	if (Bartok_Los == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_PERM_15_00"); //¿Vale?
	
	if (Bartok_Ende == TRUE)
	{		
		AI_Output (self ,other,"DIA_Bartok_PERM_04_01"); //Sí. Pero no voy a volver a salir de la ciudad. Al menos, no en breve.
		if (Bartok_OrkGesagt == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_PERM_04_02"); //Aún me tiemblan las piernas del susto que nos dio ese orco.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_PERM_04_03"); //Claro. ¡Carguémonos unas cuantas bestias!
	};
};








