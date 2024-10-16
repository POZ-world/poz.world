declare module '*.svg?react' {
    import type React from 'react';
  
    interface SVGPropsWithTitle extends React.SVGProps<SVGSVGElement> {
      title?: string;
    }
  
    const ReactComponent: React.FC<SVGPropsWithTitle>;
  
    export default ReactComponent;
  }