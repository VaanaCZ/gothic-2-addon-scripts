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
			AI_Output			(self ,other, "DIA_VinoDementor_19_00"); //Pâišel jsi nás rušit v obâadu? Jeho duše náleží nám. Teë už ho nezachráníš, mágu.
		}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
				{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_01"); //(smêje se) Pâišel jsi, abys pošpinil mé jméno i mou práci? Udêlal jsi osudovou chybu.
						AI_Output			(self ,other, "DIA_AmbientDementor_19_02"); //Nikomu se ještê nepodaâilo projít mou kryptou. Mêl by ses vrátit, protože do posvátných Irdorathských síní se nikdy nedostaneš.
				}
				else
				{	
				 	if (randy == 0)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_03"); //Už ji zašel moc daleko, mrzký èerve. Nikdy se do naší tajné svatynê nedostaneš.
					};
					if (randy == 1)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_04"); //Zùstaà stát, kde jsi. Už ani krok!
					};
					if (randy == 2)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_05"); //Dostal ses daleko, ale pâes mê nepâejdeš.
					};
					if (randy == 3)
					{
						AI_Output			(self ,other, "DIA_AmbientDementor_19_06"); //Pâišel jsi zmêâit síly s Pánem, ale nejdâíve se musíš dostat pâes mê.
					};
				};	
		}
	else if (hero.guild == GIL_KDF)
		{
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_07"); //Ubohej rádobykouzelníèku, tvá síla se nikdy nebude moci mêâit s Pánovou mocí.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_08"); //Vybral sis cestu magie, abys nás mohl porazit. Chytrý tah. Ale ve tvém podání je stejnê k nièemu.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_09"); //Nemùžeš nás zastavit ani jako mág.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_10"); //Mùj Pán tê znièí. Tvá ubohá komediantská kouzla tê nemùžou zachránit.
			};
		}
	else
		{	
		 	if (randy == 0)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_11"); //Zachraà se, dokud mùžeš. Dál už není úniku.
			};
			if (randy == 1)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_12"); //Teë pocítíš Pánovu moc. Nemùžeš jí uniknout.
			};
			if (randy == 2)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_13"); //Pán si žádá tvou hlavu. Teë už tê nic nezachrání.
			};
			if (randy == 3)
			{
				AI_Output			(self ,other, "DIA_AmbientDementor_19_14"); //Chytil ses do pasti a teë nastal èas, abychom tê odstranili z tohoto svêta.
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
