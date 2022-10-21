//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Ya conoces la norma. Nadie entra a la mina sin una tablilla de piedra roja.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Olvida la mina. Tengo que ver a Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Aún así. Aquí tenemos normas, y son para todos. Incluso para ti.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Vuelve. Si intentas entrar a la plaza de arriba sin permiso, los otros guardias te matarán. ESAS son las normas.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Si te parece mal, ve a hablar con Esteban. Es el responsable del campamento.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Tengo que dar con Raven…";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Es importante que visite a Raven
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//¿Ah, sí? ¿De verdad crees que podrás llegar hasta él?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Sus guardias tienen orden de no dejar pasar a NADIE. Te matarán antes de que puedas verle.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Quítate esa idea de la cabeza.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven es el líder de los bandidos. Tendré que deshacerme de unos cuantos para llegar a él."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "¿No me reconoces? Del Campamento Viejo.";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//¿Me recuerdas? Del Campamento Viejo
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//¿Eres uno de los prisioneros? Quizá fueras de mi guardia. ¿Y? ¿Eso nos convierte en aliados?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Pues no.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Quizá tú fuiste quien echó abajo la Barrera, o tal vez mataste a mis compañeros.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//¿Y qué?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Esos tiempos se han acabado.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//¿Quieres entrar? Pues consigue una piedra roja y no me hagas perder el tiempo.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Vamos, déjame pasar. Por los viejos tiempos.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Vamos, déjame pasar. Por los viejos tiempos.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Deja que te explique algo. ¿Sabes por qué sigo con vida?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Porque siempre he sido fiel a mi gente.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //No tengo que darle la razón a quien se la dé Raven, pero me atengo a las normas. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //¡Y eso harás tú!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(firme) ¡No!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Tengo una tablilla de piedra roja…";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Tengo una tablilla de piedra roja
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//No es la piedra correcta. Sólo valen las rojas.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Tengo una tablilla de piedra roja…";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Tengo una tablilla de piedra roja
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Vale.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Mataste a Esteban, así que TÚ harás su trabajo.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//Tienen problemas con los reptadores de la mina.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Ya lo han comprado tres cavadores. Tu deber es proporcionar repuestos.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//¿Y cuándo podré entrar en la mina maldita?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Haz tu trabajo y luego podrás hacer lo que quieras.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Como ahora ocupo el cargo de Esteban, tengo que enviar tres cavadores a la mina. ");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "He enviado a tres tipos.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//He enviado a tres tipos.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//Muy bien. Por lo que a mí respecta, puedes pasar.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Eh, ¿qué armadura es esa? ¿Dónde puedo conseguir una igual?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Eh, ¿qué armadura es esa? ¿Dónde puedo conseguir una igual?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//No puedes. Está reservada para la guardia de Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//No creo que haya examen de admisión para nuevos candidatos. Pero la decisión final no depende de mí, sino de Raven.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "¿Cómo están los prisioneros?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//¿Cómo están los prisioneros?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Mmh, han hecho su trabajo. Que yo sepa, se supone que están extrayendo oro.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//¿Y si escapan…?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//…Bloodwyn enviará a sus guardias tras ellos. Pero no creo que sean tan inconscientes como para tratar de escapar.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//A menos que
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//¿A menos que qué…?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//…alguien les incite. Pero no conozco a nadie tan estúpido para hacerlo… al menos, mientras Bloodwyn esté aquí.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//¿Qué estás planeando?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//¿¿Qué??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Ya te has deshecho de Bloodwyn también. Me pregunto quién será el siguiente. ¿Raven? ¿Yo?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//¿Tienes miedo?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//No me asusta luchar, pero sí las consecuencias de tus actos.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Este campamento es lo único que nos queda.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Puede que no siempre funcione a la perfección, pero FUNCIONA.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//Y con cada persona que matas, una parte de nuestra comunidad se quiebra.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Somos bandidos. Desterrados, criminales, desesperados.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Allá donde vayamos, nos persiguen, nos encierran y nos matan.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//No hay mejor lugar para nosotros que este, ni mejor momento que ahora.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//¿A dónde quieres llegar?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Esos hombres necesitan a alguien que les lidere. ¿Quién será el elegido? ¿Tú? ¿Tú, que no paras de ir de un sitio a otro?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Así que tú te ocupas de dirigir el campamento.";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Entonces asume tú el liderazgo del campamento.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Vale, ¿pero qué pasa con Raven?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven pronto tendrá otras preocupaciones. Yo me ocuparé de él.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Ah, vale, y asegúrate de que los prisioneros pueden irse en paz del campamento.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Muy bien. Me ocuparé de todos los guardias de aquí fuera.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn ha muerto y Thorus se asegurará de que los esclavos  dejen el campamento."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Ahora volveré a hablar con el 'guardia esclavo', así que Patrick y sus hombres pueden irse."); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"El asunto del 'guardia esclavo' está solucionado, Patrick y los suyos pueden irse."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Lo he hecho. Raven está acabado.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Lo he hecho. Raven está acabado.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//Eso significa que le has dado a Beliar un buen puntapié.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//¿Entonces seguirás adelante?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Mi trabajo en el valle ha terminado. Me vendrían bien unos días de descanso.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(risas) Sí, tú no paras nunca, ¿verdad? (serio) Que tengas buen viaje.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Quién sabe, quizá volvamos a encontrarnos.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Quién sabe. Tendrás que atravesar miles de puertas y pasadizos, y quizá me encuentres en uno de ellos
	
	AI_StopProcessInfos (self);
	
};



