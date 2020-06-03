

@protocol UIPreviewInteractionDelegatePrivate <UIPreviewInteractionDelegate>

@optional
-(id)_previewInteractionHighlighterForPreviewTransition:(id)arg1;
-(id)_previewInteraction:(id)arg1 viewControllerPresentationForPresentingViewController:(id)arg2;
-(BOOL)_previewInteractionShouldFinishTransitionToPreview:(id)arg1;
-(BOOL)_previewInteractionShouldAutomaticallyTransitionToPreviewAfterDelay:(id)arg1;
-(id)_previewInteractionViewForHighlight:(id)arg1;
-(id)_previewInteractionViewControllerForPreview:(id)arg1;
-(id)_previewInteraction:(id)arg1 appearanceTransitionForViewController:(id)arg2;
-(id)_previewInteraction:(id)arg1 disappearanceTransitionForViewController:(id)arg2;
@end
