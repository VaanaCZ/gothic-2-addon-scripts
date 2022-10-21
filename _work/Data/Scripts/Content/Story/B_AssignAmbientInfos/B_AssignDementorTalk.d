// ************************************************************
// 	     EXIT 
// ************************************************************

INSTANCE DIA_AmbientDementor_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_AmbientDementor_EXIT_Condition;
	information	= DIA_AmbientDementor_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_AmbientDementor_EXIT_Info()
{	
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
	B_SCIsObsessed (self);
	Npc_SetRefuseTalk (self,5);	
	Snd_Play 	("MFX_FEAR_CAST" );

	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
			{
				DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
				DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
			}
			else
			{
			B_Attack (self, other, AR_SuddenEnemyInferno, 1);
			};
};	
///////////////////////////////////////////////////////////////////////
//	AmbientDementor Info
///////////////////////////////////////////////////////////////////////
instance DIA_AmbientDementor		(C_INFO)
{
	nr		 	= 	1;
	condition	= 	DIA_AmbientDementor_Condition;
	information	= 	DIA_AmbientDementor_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_AmbientDementor_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_AmbientDementor_Info ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	

		var int randy;
		randy = Hlp_Random (4);
	
		
	if (	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
		||	(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
		{	
			AI_Output			(self ,other, "DIA_VinoDementor_19_00"); //Bist du gekommen unser Ritual zu stören? Seine Seele gehört uns. Du kannst ihn nicht mehr retten, Magier.
		}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
				{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_01"); //(lacht) Du bist gekommen, um mich und mein Werk herauszufordern? Du wirst versagen.
						AI_Output			(self ,other, "DIA_AmbientDementor_19_02"); //Es ist noch niemandem gelungen, meine Krypta zu überwinden. Kehr um, denn auch du wirst die heiligen Hallen von Irdorath niemals erreichen.
				}
				else
				{	
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //Du bist schon viel zu weit gekommen, du Wurm. In unser innerstes Heiligtum wird du nicht gelangen.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //Bleib stehen. Keinen Schritt weiter.
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Bis hierher hast du es geschafft, doch an mir kommst du nicht vorbei.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //Du bist gekommen, den Meister herauszufordern, aber dazu musst du erst an mir vorbei.
					};
				};	
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //Du kleiner schwacher Magier wirst es nicht mit der Macht des Meisters aufnehmen können.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //Du hast den Weg der Magie gewählt, um uns zu bezwingen. Ein cleverer Schachzug. Aber auch das wird dir nichts nützen.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Auch als Magier wirst du uns nicht aufhalten können.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //Mein Meister wird dich vernichten. Deine lächerlichen magischen Kunststückchen werden dich nicht retten.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Gib auf, solange du noch kannst. Es gibt kein Entkommen für dich.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Nun wirst du die Macht unseres Meisters spüren. Du kannst ihr nicht entrinnen.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //Der Meister will deinen Kopf. Niemand wird dich jetzt noch retten können.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Du bist uns in die Falle gegangen und jetzt werden wir dich vernichten.
			};
		};
};


func void B_AssignDementorTalk (var C_Npc slf)
{	
	if 	(slf.guild == GIL_DMT)
	&&	(slf.npctype == NPCTYPE_AMBIENT)
	{
		DIA_AmbientDementor_EXIT.npc	= Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc			= Hlp_GetInstanceID(slf);
	};
};	
