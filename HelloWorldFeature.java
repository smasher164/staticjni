import com.oracle.svm.core.annotate.AutomaticFeature;
import com.oracle.svm.core.jdk.NativeLibrarySupport;
import com.oracle.svm.core.jdk.PlatformNativeLibrarySupport;
import com.oracle.svm.hosted.FeatureImpl;
import com.oracle.svm.hosted.c.NativeLibraries;
import org.graalvm.nativeimage.hosted.Feature;

@AutomaticFeature
public class HelloWorldFeature implements Feature {

    @Override
    public void beforeAnalysis(BeforeAnalysisAccess access) {
        NativeLibrarySupport.singleton().preregisterUninitializedBuiltinLibrary("HelloWorld");
        PlatformNativeLibrarySupport.singleton().addBuiltinPkgNativePrefix("HelloWorld");
        NativeLibraries nativeLibraries = ((FeatureImpl.BeforeAnalysisAccessImpl) access).getNativeLibraries();
        nativeLibraries.addStaticJniLibrary("HelloWorld");
    }
}
