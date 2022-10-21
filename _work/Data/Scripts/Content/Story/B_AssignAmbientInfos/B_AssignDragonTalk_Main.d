// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "�C�mo has venido por aqu�?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Siervo del mal, �qu� te ha tra�do aqu�? �Has venido �nicamente para sembrar terror y p�nico?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //No vas a desentra�ar la finalidad de nuestro congreso en este mundo, hombrecillo.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "�C�mo puedo hacer que hablen los dem�s dragones?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "�Qu� tengo que hacer para que vuelvas a desaparecer?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //En el nombre de Innos, �qu� debo hacer para desterraros de nuevo de los reinos humanos?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //(Se r�e) Antes de que puedas hacer nada, debes comprender el significado de nuestro congreso.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Sin embargo, nadie va a revel�rtelo de motu proprio.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Solo el Ojo podr�a soltarnos la lengua y hacer que revel�ramos nuestras verdaderas metas.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //En cualquier caso, no te resultar� �til cuando est�s muerto.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Ya nos han informado que has elegido la senda del cazador de dragones.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Por lo tanto, hemos enviado a nuestros v�stagos a tu mundo para asegurar la continuaci�n de nuestro linaje ancestral.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Ya has fracasado, hombrecillo.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Uno de los dragones mascull� algo acerca de su ''progenie'' y la continuidad de su l�nea de sangre ancestral. Me temo que han extendido su semilla por el mundo civilizado."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //El Ojo te ha permitido acceder hasta aqu�. Sin embargo, demostrar�s tu val�a en un combate singular.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //�C�mo puedo hacer que hablen los dem�s dragones?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Solo mi coraz�n podr�a ayudarte a renovar el poder del Ojo.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Pero no vas a conseguir arrebat�rmelo.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "�Qui�n te ha enviado aqu�?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //�A qui�n obedeces? �Qui�n te env�a?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //El amo controla con su palabra de poder nuestro futuro y bienestar. Dentro de poco tiempo nadie podr� resistirse a �l.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Su largo brazo se estira desde el Reino de los Muertos. Los esp�ritus de la noche se congregan y esperan dichosos su llegada.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Os vencer� a los humanos y dominar� el mundo.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //Nos eclipsa y no somos m�s que accesorios para su poder creador.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //El amo vendr� para alzar vuestros cuerpos afligidos de las cenizas y los usar� para transformar el destino del mundo.

	B_LogEntry (TOPIC_DRACHENJAGD,"Los dragones no son sus propios amos. Sirven a un amo del que no quieren que se divulgue nada que no sean vagas profec�as. El amo vendr� para destruir el mundo y todo eso. Lo de siempre."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "�C�mo puedo derrotar a tu amo?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //�C�mo puedo derrotar a tu amo?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Es todopoderoso y pr�cticamente invencible. No obstante, si eres lo suficientemente insensato como para enfrentarte con �l, sufrir�s una muerte lenta y dolorosa.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //No es la primera vez que oigo algo as�. Aunque sea pr�cticamente invencible, puedo matarlo.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Venga, su�ltalo: �qu� he de hacer?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Para enfrentarte a mi amo, necesitas cosas que �l nunca ser�a capaz de obtener.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //�Y cu�les son?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Debes hacerte con la mejor armadura de tu comunidad terrenal y pon�rtela sobre tu piel.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Necesitas una espada que haya sido bendecida por tu dios.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Necesitas una runa creada para ti.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Necesitas un arma forjada para ti.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Pero la condici�n m�s dif�cil es que debes conseguir cinco compa�eros que te sigan hasta la muerte.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Solo entonces podr�s atreverte a enfrentarte al amo.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "�C�mo puedo encontrar a tu amo?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //�C�mo puedo encontrar a tu amo?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Tiene su cubil en la roca maciza de los salones de Irdorath y all� espera su destino.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Hasta que pueda restaurar el orden que se merece este mundo, all� espera meditando y...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Ah�rrate los detalles. Dime d�nde est�n los salones sagrados de Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ja, ja, ja. Me decepcionas, hombrecillo. Has afrontado todos los peligros y casi nos vences a todos, pero no consigues aprovechar la informaci�n importante.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Si Irdorath no significa nada para ti, ser�a mejor que vayas a ver a los magos y les pidas que se ocupen ellos de sus asuntos mundanos.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Resulta evidente que no est�s preparado para soportar la pesada carga de su conocimiento superior.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Se dice que el amo de los dragones se ha refugiado en la fortaleza rocosa de los sagrados salones de Irdorath. Mmm. Me suena. �D�nde he le�do esto?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













